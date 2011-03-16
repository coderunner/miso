require 'miso'

$MISO_STATIC_ROOT = "_site"
$MISO_APP_ROOT = "_app"

app_dir_list = ::Dir[$MISO_APP_ROOT+'/*'].reject{|o| not ::File.directory?(o)}
app_dir_list.each do |app_folder|
  app = Miso.load app_folder
  app_name = app_folder.split('/')[-1]
  map '/'+app_name do
    run Miso::Context.new app, {:app_path => '/'+app_folder} 
  end
end

map '/' do 
  run Miso::StaticSite.new $MISO_STATIC_ROOT
end
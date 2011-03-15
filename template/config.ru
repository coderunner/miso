require 'miso'

$MISO_STATIC_ROOT = "_site"
$MISO_APP_ROOT = "_app"

app_dir_list = ::Dir[$MISO_APP_ROOT+'/*'].reject{|o| not ::File.directory?(o)}
app_dir_list.each do |app_folder|
  app = Miso.load app_folder
  map '/'+app_folder do
    run Miso::Context.new app, {:app_path => '/'+app_folder} 
  end
end

map '/' do 
  run Miso::StaticSite.new $MISO_STATIC_ROOT
end
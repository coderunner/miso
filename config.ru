require 'lib/miso'

$static_root = "site"
$app_root = "app"

app_dir_list = ::Dir[$app_root+'/*'].reject{|o| not ::File.directory?(o)}
app_dir_list.each do |app_folder|
  app = Miso.load app_folder
  map '/'+app_folder do
    run Miso::Context.new app, {:app_path => '/'+app_folder} 
  end
end

map '/' do 
  run Miso::StaticSite.new $static_root
end
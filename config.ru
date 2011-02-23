require 'lib/miso/static'
require 'lib/miso/loader'
require 'lib/miso/context'

# This is the root of our app
$static_root = "site"
$app_root = "app"

#make this configurable and dynamic
Miso.load($app_root, "example").each do |name, app|
  map '/'+$app_root+'/'+name do
    run Miso::Context.new app, {:app_path => '/'+$app_root+'/'+name} 
  end
end

map '/' do 
  run Miso::StaticSite.new $static_root
end
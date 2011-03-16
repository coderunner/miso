module Miso
  # Load a Rack application from a config.ru file.
  def load(app_path)
    currentDir = Dir.getwd
    Dir.chdir(currentDir+'/'+app_path)
    rackup_code = ::File.read('config.ru') 
    app = eval("Rack::Builder.new {( #{rackup_code}\n )}.to_app")
    Dir.chdir(currentDir)
    app
  end
  
  module_function :load
end
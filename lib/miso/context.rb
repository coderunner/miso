module Miso
  #Rack middleware that intercept request to the Rack application
  #rewrite the path so that is seems to target the base URL.
  class Context
    @@REWRITE= ['REQUEST_PATH', 'PATH_INFO', 'REQUEST_URI']
    def initialize (app, option={})
      @app = app
      @path = option[:app_path]
    end
    
    def call(env)
      mainDir = Dir.getwd
      Dir.chdir(mainDir+'/'+@path)
      rewritePath(env)
      status, headers, response = @app.call(env)
      Dir.chdir(mainDir)
      [status, headers, response]
    end
    
    #Rewrite the path in the original request.
    def rewritePath(env)
      @@REWRITE.each do |key|
        env[key] = env[key].gsub(@path, '')
      end
    end
  end
end
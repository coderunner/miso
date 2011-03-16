module Miso
  #Rack middleware that intercept request to the Rack application
  #rewrite the path so that is seems to target the base URL.
  class Context
    #Request env variable to rewrite.
    @@REWRITE= ['REQUEST_PATH', 'PATH_INFO', 'REQUEST_URI']
    
    #Receive the app and the option list (for now only the :app_path).
    def initialize (app, option)
      @app = app
      @path = option[:app_path]
    end
    
    #Execute request.
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
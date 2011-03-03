require 'rack'

module Miso
  class StaticSite
    def initialize(static_site_path)
      @root = static_site_path
      @not_found = '404.html'
    end
    def call(env)
      path = Rack::Utils.unescape(env['PATH_INFO'])
      if path == "/"
        # Return the index
        env['REQUEST_PATH']="/index.html"
        env['PATH_INFO']="/index.html"
        env['REQUEST_URI']="/index.html"
        path = path+'index.html'
      end
      if !::File.exists?(@root+path) and ::File.exists?(@root+'/'+@not_found)
        env['PATH_INFO']=@not_found
      end
      Rack::Directory.new(@root).call(env)
    end
  end  
end
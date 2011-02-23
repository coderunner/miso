require 'rack'

module Miso
  class StaticSite
    def initialize(static_site_path)
      @root = static_site_path
    end
    def call(env)
      path = Rack::Utils.unescape(env['REQUEST_PATH'])
        if path == "/"
          # Return the index
          env['REQUEST_PATH']="/index.html"
          env['PATH_INFO']="/index.html"
          env['REQUEST_URI']="/index.html"
        end
        Rack::Directory.new(@root).call(env)
    end
  end  
end
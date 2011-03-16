require 'rack'

module Miso
  #Rack application to handle static site.
  class StaticSite
    @@NOT_FOUND_PAGE = '404.html'
    
    #Receives static site base path.
    def initialize(static_site_path)
      @root = static_site_path
      @static_page_server = Rack::Directory.new(@root)
    end
    
    #Execute request.
    def call(env)
      path = Rack::Utils.unescape(env['PATH_INFO'])
      not_found = false
      
      #if / then route to index.html
      if path == "/"
        # Return the index
        env['PATH_INFO']="/index.html"
        path = path+'index.html'
      end
      
      #if page does not exists then route to 404.html
      if !::File.exists?(@root+path) and ::File.exists?(@root+'/'+@@NOT_FOUND_PAGE)
        env['PATH_INFO']=@@NOT_FOUND_PAGE
        not_found = true
      end
      
      #call Directory to resolve
      code, headers, body = @static_page_server.call(env)
      
      #override to 404 if page not found
      [not_found ? 404 : code, headers, body]
    end
  end  
end
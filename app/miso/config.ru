require 'erb'

$miso_app_folder = ::File.expand_path(::File.dirname(__FILE__))+'/..'
$miso_app_dir_list = ::Dir[$miso_app_folder+'/*'].reject{|o| not ::File.directory?(o)}
$miso_version = '0.1'
$HTML = '<!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml\" xml:lang="en" lang="en-us">
    <head>
       <meta http-equiv="content-type" content="text/html; charset=utf-8" />
       <title>timerack</title>
       <meta name="author" content="Felix Trepanier" />
    </head>
    <body>
      <center>
      <h2>running on miso version <%= $miso_version %></h2>
      <h3>app running:</h3>
      <ul>
      <% $miso_app_dir_list.each do |app_name|%>
        <li><%= app_name %></li>
      <% end %>      
      </ul> 
    </body> 
    </html>'
     
@app = lambda do |env|
  [200, {'Content-Type'=>'text/html'}, ERB.new($HTML).result]
end

run @app
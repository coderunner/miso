require 'erb'

$miso_app_folder = ::File.expand_path(::File.dirname(__FILE__))+'/..'
$miso_app_dir_list = ::Dir[$miso_app_folder+'/*'].reject{|o| not ::File.directory?(o)}
$miso_version = '0.1'

$miso_page = ''    
::File.open("miso.erb", "r") do |infile|
  infile.each do |line|
    $miso_page<<line
  end
end

@app = lambda do |env|
  [200, {'Content-Type'=>'text/html'}, ERB.new($miso_page).result]
end

run @app
task :default => :deploy

desc "deploy apps"
task :deploy do
  pwd = Dir.getwd 
  Dir.chdir('app')
  Dir['*.gem'].each do |gem|
    sh "gem unpack #{gem}"
    m = gem.match '(.*)-([\d+\.]*)\.gem'
    gem_folder = gem.sub('.gem','')
    sh "mv #{gem_folder} #{m[1]}"
  end
  Dir.chdir(pwd)  
end

desc "Run miso tests"
task :test do  
  sh "bacon -I./lib:./test -a"
end


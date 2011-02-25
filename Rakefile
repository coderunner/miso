task :default => :deploy

desc "install apps"
task :install do
  if File.exists?("miso.soup") then
    puts 'file exists'
    File.open("miso.soup") do |file|
      puts 'open'
      file.each_line do |line|
        puts line
        if /^static/.match(line) then
          static_path = line.split(':')[1].strip
          FileUtils.rm_rf('./site/*')
          puts "cp #{static_path} site/"
          FileUtils.cp_r(static_path, 'site/')
        elsif /^gem/.match(line) then
          gem = line.split(':')[1].strip
          puts "cp #{gem} app/"
          FileUtils.cp(gem, 'app/')
        end
      end
    end
  end
end

desc "deploy apps"
task :deploy => :install do
  pwd = Dir.getwd 
  Dir.chdir('app')
  Dir['*.gem'].each do |gem|
    sh "gem unpack #{gem}"
    m = gem.match '(.*)-([\d+\.]*)\.gem'
    if File.exists?(m[1]) then
      FileUtils.rm_rf(m[1])
    end
    gem_folder = gem.sub('.gem','')
    sh "mv #{gem_folder} #{m[1]}"
  end
  Dir.chdir(pwd)  
end

desc "Run miso tests"
task :test do  
  sh "bacon -I./lib:./test -a"
end
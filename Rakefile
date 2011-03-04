require 'spec/rake/spectask'

task :default => :test

desc "Run miso tests"
Spec::Rake::SpecTask.new('test') do |t|
  t.spec_files = FileList['spec/**/*spec.rb']
end
# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "miso/version"

Gem::Specification.new do |s|
  s.name        = "misosoup"
  s.version     = Miso::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Felix Trepanier"]
  s.email       = ["felixtrepanier@gmail.com"]
  s.homepage    = "http://side-experiment.com"
  s.summary     = %q{Rack application aggregator}
  s.description = <<-EOF
MisoSoup is a Rack application which can server any number of sub-Rack applications
and a static web site.
EOF

  s.files 		  = Dir['lib/**/*', 'bin/*', 'spec/**/*', 'template/**/*', 'Rakefile', 'Gemfile', 'Gemfile.lock']
  s.test_files    = Dir['spec/**/*']
  s.executables   = ['miso']
  s.require_paths = ["lib"]

  s.add_dependency('rack', '~> 1.2.0')

  # Test libraries
  s.add_development_dependency('rspec', '2.5.0')
end


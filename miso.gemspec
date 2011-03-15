# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "miso/version"

Gem::Specification.new do |s|
  s.name        = "miso"
  s.version     = Miso::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Felix Trepanier"]
  s.email       = ["felixtrepanier@gmail.com"]
  s.homepage    = "http://side-experiment.com"
  s.summary     = %q{Rack application aggregator}
  s.description = <<-EOF
Miso is a Rack application which can server any number of sub-Rack applications
and a static web site.
EOF

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency('rack', '~> 1.2.0')

  # Test libraries
  s.add_development_dependency('rspec', '2.5.0')
end


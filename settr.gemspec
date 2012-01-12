# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "settr/version"

Gem::Specification.new do |s|
  s.name        = "settr"
  s.version     = Settr::VERSION
  s.authors     = ["Torsten Sprenger"]
  s.email       = ["ts@metaminded.com"]
  s.homepage    = "https://github.com/provideal/settr"
  s.summary     = %q{key-value based storage for configuration settings in Rails apps}
  s.description = %q{Settr is a key-value based storage for configuration settings in Rails apps}

  s.rubyforge_project = "settr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails', '~> 3.1'
  s.add_dependency 'simple_form'
end

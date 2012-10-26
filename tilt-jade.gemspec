# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tilt-jade/version"

Gem::Specification.new do |s|
  s.name        = "tilt-jade"
  s.version     = TiltJade::VERSION
  s.authors     = ["David Haslem"]
  s.email       = ["therabidbanana@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Tilt engine to compile Jade templates into JS closures via ExecJS}
  s.description = %q{Jade is a high performance template engine heavily influenced by Haml and implemented with JavaScript for node.}

  s.rubyforge_project = "tilt-jade"
  s.add_dependency 'execjs'
  s.add_dependency 'tilt'
  s.add_dependency 'sprockets'
  # s.add_dependency 'rails'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end

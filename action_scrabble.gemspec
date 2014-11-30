# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'action_scrabble/version'

Gem::Specification.new do |spec|
  spec.name          = "action_scrabble"
  spec.version       = ActionScrabble::VERSION
  spec.authors       = ["Matthew Powers"]
  spec.email         = ["matthewkevinpowers@gmail.com"]
  spec.summary       = %q{Scrabble word helpers}
  spec.description   = %q{A highly configurable API to find words in Scrabble.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end

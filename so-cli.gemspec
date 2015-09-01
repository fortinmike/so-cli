# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'so-cli/version'

Gem::Specification.new do |spec|
  spec.name          = "so-cli"
  spec.version       = SoCli::VERSION
  spec.authors       = ["Michaël Fortin"]
  spec.email         = ["fortinmike@irradiated.net"]

  spec.summary       = %q{A modular command-line tool.}
  spec.description   = %q{so-cli (especially combined with a front-end) is to Alfred what maid is to Hazel.}
  spec.homepage      = "https://github.com/fortinmike/so-cli"
  
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  
  spec.add_runtime_dependency "claide", "~> 0.8", ">= 0.8.0"
  spec.add_runtime_dependency "colored", "~> 1.2"
end

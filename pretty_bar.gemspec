# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_bar'

Gem::Specification.new do |spec|
  spec.name          = "pretty_bar"
  spec.version       = PrettyBar::VERSION
  spec.authors       = ["Frank Hamand"]
  spec.email         = ["frank.hamand@factorymedia.com"]
  spec.summary       = "Pretty progress bar"
  spec.description   = "Prints a pretty progress bar to the console."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.4"
  spec.add_development_dependency "rake"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mind_the_changes/version'

Gem::Specification.new do |spec|
  spec.name          = "mind_the_changes"
  spec.version       = MindTheChanges::VERSION
  spec.authors       = ["Jing Li"]
  spec.email         = ["thyrlian@gmail.com"]

  spec.summary       = %q{Mind the code changes since last release.}
  spec.homepage      = "https://github.com/thyrlian/mind_the_changes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "mocha", "~> 1.1"
end

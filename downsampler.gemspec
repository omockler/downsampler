# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'downsampler/version'

Gem::Specification.new do |spec|
  spec.name          = "downsampler"
  spec.version       = Downsampler::VERSION
  spec.authors       = ["Owen Mockler"]
  spec.email         = ["omockler@gmail.com"]
  spec.summary       = %q{Downsample and group temporal data sets in ruby.}
  spec.description   = %q{Downsample and group temporal data sets in ruby. Great for preparing time data for display in a chart.}
  spec.homepage      = "https://github.com/omockler/downsampler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-nc", "~> 0.1"
end

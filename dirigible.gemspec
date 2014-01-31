# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dirigible/version'

Gem::Specification.new do |spec|
  spec.name          = "dirigible"
  spec.version       = Dirigible::VERSION
  spec.authors       = ["Anthony Smith"]
  spec.email         = ["anthony@sticksnleaves.com"]
  spec.description   = %q{An Urban Airship v3 API wrapper written in Ruby}
  spec.summary       = %q{Urban Airship REST API client library for Ruby}
  spec.homepage      = "https://github.com/anthonator/dirigible"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "faraday",            "~> 0.8"
  spec.add_dependency "faraday_middleware", "~> 0.9"
  spec.add_dependency "hashie",             "~> 2.0"
  spec.add_dependency "multi_json",         "~> 1.8"
  spec.add_dependency "rack"
end

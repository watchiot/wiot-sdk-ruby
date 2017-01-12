# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiot-sdk/version'

Gem::Specification.new do |spec|
  spec.name          = 'wiot-sdk'
  spec.version       = WiotSdk::VERSION
  spec.authors       = ['watchiot']
  spec.email         = ['dev@watchiot.com']

  spec.summary       = %q{Watchiot SDK}
  spec.description   = %q{Watchiot SDK is for agent}
  spec.homepage      = 'http://www.watchiot.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end

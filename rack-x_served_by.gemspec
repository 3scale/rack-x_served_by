# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/x_served_by/version'

Gem::Specification.new do |spec|
  spec.name          = 'rack-x_served_by'
  spec.version       = Rack::XServedBy::VERSION
  spec.authors       = ['Michal Cichra']
  spec.email         = ['michal@3scale.net']

  spec.summary       = %q{Adds X-Served-By header to responses with server's hostname}
  spec.description   = %q{Allows you to know from which server the response originated from.}
  spec.homepage      = 'https://github.com/3scale/rack-x_served_by'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb'] + ['README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
end

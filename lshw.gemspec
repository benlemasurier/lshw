# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lshw/version'

Gem::Specification.new do |spec|
  spec.name          = 'lshw'
  spec.version       = Lshw::VERSION
  spec.authors       = ['Ben LeMasurier']
  spec.email         = ['ben.lemasurier@gmail.com']

  spec.summary       = 'An `lshw` parsing rubygem'
  spec.description   = 'Parses `lshw` output for easy integration'
  spec.homepage      = 'https://github.com/benlemasurier/lshw'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',  '~> 1.9'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'rubocop',  '~> 0.30'
  spec.add_development_dependency 'minitest', '~> 5.6'

  spec.add_dependency 'nokogiri', '~> 1.6'
end

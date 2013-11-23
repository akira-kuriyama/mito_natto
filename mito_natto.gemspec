# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mito_natto/version'

Gem::Specification.new do |spec|
  spec.name          = 'mito_natto'
  spec.version       = MitoNatto::VERSION
  spec.authors       = ['akira-kuriyama']
  spec.email         = ['marronshepherd2@gmail.com']
  spec.description   = %q{Nattoをラップして少し使いやすくしたライブラリです}
  spec.summary       = %q{Nattoをラップして少し使いやすくしたライブラリ}
  spec.homepage      = 'https://github.com/akira-kuriyama/mito_natto.git'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 2.0'

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_runtime_dependency 'natto', '~> 0.9.6'


end

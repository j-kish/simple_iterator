# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_iterator/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_iterator'
  spec.version       = SimpleIterator::VERSION
  spec.authors       = ['Joshimasa KISHIMOTO']
  spec.email         = ['joshimasa.kishimoto@gmail.com']

  spec.summary       = %q{Simple iterator}
  spec.description   = %q{Simple iterator}
  spec.homepage      = 'https://github.com/jkishimoto/simple_iterator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end

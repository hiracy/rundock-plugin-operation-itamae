# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rundock/plugin/operation/itamae/version'

Gem::Specification.new do |spec|
  spec.name          = "rundock-plugin-operation-itamae"
  spec.version       = Rundock::Plugin::Operation::Itamae::VERSION
  spec.authors       = ["hiracy"]
  spec.email         = ["leizhen@mbr.nifty.com"]

  spec.summary       = %q{rundock plugin for itamae operation}
  spec.homepage      = 'https://github.com/hiracy/rundock-plugin-operation-itamae'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'serverspec', '~> 2.1'
  spec.add_development_dependency "rundock"
  spec.add_runtime_dependency     "itamae", ">= 1.5.0"
end

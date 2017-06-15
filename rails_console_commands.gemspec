# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_console_commands/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_console_commands'
  spec.version       = RailsConsoleCommands::VERSION
  spec.authors       = ['Dave Allie']
  spec.email         = ['dave@tanda.co']

  spec.summary       = 'Run rake/rails and test commands through the console'
  spec.homepage      = 'https://github.com/TandaHQ/rails_console_commands'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*'] + Dir['*.md'] + %w[Gemfile LICENSE.txt]
  spec.bindir = 'exe'
  spec.executables = Dir['exe/*']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.49'

  spec.add_dependency 'rails', '~> 5'
end

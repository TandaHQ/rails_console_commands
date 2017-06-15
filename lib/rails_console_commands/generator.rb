# frozen_string_literal: true

require 'rails/generators'

module RailsConsoleCommands
  class Generator
    def initialize
      load_rails_generators
    end

    def generate(argv = nil)
      generator :generate, argv
    end

    def update(argv = nil)
      generator :update, argv
    end

    def destroy(argv = nil)
      generator :destroy, argv
    end

    private

    def load_rails_generators
      Rails.application.load_generators
    end

    def generator(name, argv = nil)
      if argv.nil?
        # FIXME: I don't know why we can't just catch SystemExit here, then we wouldn't need this if block
        Rails::Generators.help name
      else
        argv = argv.split(' ') if argv.respond_to?(:split)
        argv ||= []
        Rails::Command.invoke('generate', argv)
      end

      'Completed'
    end
  end
end

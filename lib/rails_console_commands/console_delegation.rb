# frozen_string_literal: true

require_relative './commander'

module RailsConsoleCommands
  module ConsoleDelegation
    def commander
      @commander ||= Commander.new
    end

    def test(*args)
      if Rails.env.test?
        commander.test(*args)
      else
        puts 'You can only run tests in a console started in the test environment. ' \
             'Use `rails console test` to start such a console'
      end
    end

    delegate :rake, :generate, :destroy, :update, to: :commander
  end
end

# frozen_string_literal: true

require_relative './test_environment'

module RailsConsoleCommands
  class Tester
    def test(what = nil, line = nil)
      case what
      when NilClass
        print_test_usage
      when 'all'
        run('test/**/**/*_test.rb', line)
      when %r{^[^/]+$} # models
        run("test/#{what}/**/*_test.rb", line)
      when %r{[/]+} # models/person
        run("test/#{what}_test.rb", line)
      end

      'Completed'
    end

    private

    def run(test_pattern, line = nil)
      line = nil unless line_available?(test_pattern, line)

      TestEnvironment.fork do
        if line
          Minitest.class_variable_set(:@@installed_at_exit, true)
          M::Runner.new(["#{test_pattern}:#{line}"]).run
        else
          Dir[test_pattern].each do |path|
            require File.expand_path(path)
          end
        end
      end
    end

    def print_test_usage
      puts <<-EOT
  Usage:
    test "WHAT"[, line_number]

  Description:
      Runs either a full set of test suites or single suite.

      If you supply WHAT with either models, controllers, helpers, integration, or performance,
      those whole sets will be run.

      If you supply WHAT with models/person, just test/models/person_test.rb will be run.
  EOT
    end

    def line_available?(test_pattern, line)
      return false unless line

      unless defined?(M::Runner)
        puts "WARNING: You attempted to define a line number, but you don't have the 'm' gem. " \
             "Please install the 'm' gem if you which to define line numbers"
        return false
      end

      if test_pattern.include?('*')
        puts 'WARNING: Using wildcard runner, line number ignored.'
        return false
      end

      true
    end
  end
end

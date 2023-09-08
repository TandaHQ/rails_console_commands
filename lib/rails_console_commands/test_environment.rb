# frozen_string_literal: true

require_relative './environment'

module RailsConsoleCommands
  module TestEnvironment
    class << self
      def fork
        Environment.fork do
          setup_for_test
          disable_reloading { yield }
        end

        reset_active_record
      end

      private

      def setup_for_test
        reload_classes
        add_test_dir_to_load_path
      end

      # Code should not be reloaded while tests are running, as this tends
      # to cause Active Record connection errors, and causes unreliable test runs.
      # `reload_classes` will ensure that the code is reloaded before tests commence.
      def disable_reloading
        was = Rails.application.reloader.check
        Rails.application.reloader.check = lambda { false }

        yield
      ensure
        Rails.application.reloader.check = was
      end

      def reload_classes
        Rails.application.reloader.reload!
        Rails.application.reloader.prepare!
      end

      def reset_active_record
        ActiveRecord::Base.connection_handler.clear_active_connections!(:all)
      end

      def add_test_dir_to_load_path
        test_path = Rails.root.join('test')
        $LOAD_PATH.unshift(test_path) unless $LOAD_PATH.first == test_path
      end
    end
  end
end

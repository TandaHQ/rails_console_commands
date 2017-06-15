# frozen_string_literal: true

require_relative './environment'

module RailsConsoleCommands
  module TestEnvironment
    class << self
      def fork
        Environment.fork do
          setup_for_test
          yield
        end

        reset_active_record
      end

      private

      def setup_for_test
        reload_classes
        add_test_dir_to_load_path
      end

      def reload_classes
        # Overwrite the default config.cache_classes = true,
        # so we can change classes in the test session.
        ActiveSupport::Dependencies.mechanism = :load

        Rails.application.reloader.reload!
        Rails.application.reloader.prepare!
      end

      def reset_active_record
        return unless defined? ApplicationRecord
        ApplicationRecord.clear_active_connections!
        ApplicationRecord.establish_connection
      end

      def add_test_dir_to_load_path
        test_path = Rails.root.join('test')
        $LOAD_PATH.unshift(test_path) unless $LOAD_PATH.first == test_path
      end
    end
  end
end

# frozen_string_literal: true

module RailsConsoleCommands
  module Environment
    def self.fork
      Kernel.fork do
        yield
        Kernel.exit
      end

      Process.waitall
    end
  end
end

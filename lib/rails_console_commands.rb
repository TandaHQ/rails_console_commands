# frozen_string_literal: true

require 'rails/console/app'
require_relative './rails_console_commands/console_delegation'
require_relative './rails_console_commands/version'

Rails::ConsoleMethods.send :include, RailsConsoleCommands::ConsoleDelegation

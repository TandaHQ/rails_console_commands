# frozen_string_literal: true

require_relative './raker'
require_relative './tester'
require_relative './generator'

module RailsConsoleCommands
  class Commander
    delegate :rake, to: :raker
    delegate :test, to: :tester
    delegate :generate, :destroy, :update, to: :generator

    attr_reader :raker, :tester, :generator

    def initialize
      @raker     = Raker.new
      @tester    = Tester.new
      @generator = Generator.new
    end
  end
end

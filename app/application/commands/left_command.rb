# frozen_string_literal: true

module Application
  module Commands
    class LeftCommand
      def initialize(robot:)
        @robot = robot
      end

      def execute
        raise StandardError.new('Robot not placed yet') unless @robot.placed?

        @robot.turn_left
      end
    end
  end
end

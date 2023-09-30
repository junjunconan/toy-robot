# frozen_string_literal: true

module Application
  module Commands
    class RightCommand
      def initialize(robot:)
        @robot = robot
      end

      def execute
        raise StandardError.new('Robot not placed yet') unless @robot.placed?

        @robot.turn_right
      end
    end
  end
end

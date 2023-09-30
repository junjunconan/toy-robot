# frozen_string_literal: true

module Application
  module Commands
    class MoveCommand
      def initialize(robot:, table:)
        @robot = robot
        @table = table
      end
      
      def execute
        raise StandardError.new('Robot not placed yet') unless @robot.placed?

        raise NotImplementedError
      end
    end
  end
end

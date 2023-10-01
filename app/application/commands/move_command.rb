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

        position = @robot.position.new_position_from(direction: @robot.direction)
        raise StandardError.new("Invalid position: #{position.x_coordinate},#{position.y_coordinate}") unless @table.valid_position?(position)

        @robot.move_to(new_position: position)
      end
    end
  end
end

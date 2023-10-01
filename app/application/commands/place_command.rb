# frozen_string_literal: true

module Application
  module Commands
    class PlaceCommand
      def initialize(robot:, table:, x:, y:, direction:)
        @robot = robot
        @table = table
        @x = x
        @y = y
        @direction = direction
      end
      
      def execute
        x_coordinate = Integer(@x) rescue nil
        y_coordinate = Integer(@y) rescue nil
        position = Domain::Position.new(x_coordinate, y_coordinate)
        raise StandardError.new("Invalid position: #{@x},#{@y}") unless @table.valid_position?(position)

        direction = @direction&.strip&.upcase
        raise StandardError.new("Invalid direction: #{@direction}") unless Domain::Direction::VALUES.include?(direction)

        @robot.place(position: position, direction: direction)
      end
    end
  end
end

# frozen_string_literal: true

module Domain
  class Position
    attr_reader :x_coordinate, :y_coordinate

    def initialize(x_coordinate, y_coordinate)
      @x_coordinate = x_coordinate
      @y_coordinate = y_coordinate
    end

    def valid?
      @x_coordinate.is_a?(Integer) && @y_coordinate.is_a?(Integer)
    end

    def new_position_from(direction:, step: 1)
      case direction
      when 'NORTH'
        Position.new(@x_coordinate, @y_coordinate + step)
      when 'EAST'
        Position.new(@x_coordinate + step, @y_coordinate)
      when 'SOUTH'
        Position.new(@x_coordinate, @y_coordinate - step)
      when 'WEST'
        Position.new(@x_coordinate - step, @y_coordinate)
      else
        raise StandardError.new('Invalid direction')
      end
    end
  end
end

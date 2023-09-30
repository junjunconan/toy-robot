# frozen_string_literal: true

module Domain
  class Robot
    def initialize(position: nil, direction: nil)
      @position = position
      @direction = direction
    end

    def place(position:, direction:)
      @position = position
      @direction = direction
    end

    def placed?
      !@position.nil? && !@direction.nil?
    end

    def move(new_position:)
      @position = new_position
    end

    def turn_left
      @direction = Direction::VALUES[(Direction::VALUES.index(@direction) - 1) % 4]
    end

    def turn_right
      @direction = Direction::VALUES[(Direction::VALUES.index(@direction) + 1) % 4]
    end
    
    def report
      if placed?
        "#{@position.x_coordinate},#{@position.y_coordinate},#{@direction}"
      else
        'Not placed yet'
      end
    end
  end
end

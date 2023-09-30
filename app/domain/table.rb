# frozen_string_literal: true

module Domain
  class Table
    def initialize(width:, height:)
      @width = width
      @height = height
    end

    def valid_position?(position)
      position.x_coordinate >= 0 && position.y_coordinate >= 0 && position.x_coordinate < @width && position.y_coordinate < @height
    end
  end
end

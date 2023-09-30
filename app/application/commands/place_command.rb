# frozen_string_literal: true

module Application
  module Commands
    class PlaceCommand
      def initialize(robot:, table:)
        @robot = robot
        @table = table
      end
      
      def execute
        raise NotImplementedError
      end
    end
  end
end

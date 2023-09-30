# frozen_string_literal: true

module Application
  module Commands
    class ReportCommand
      def initialize(robot:)
        @robot = robot
      end

      def execute
        puts "Output: #{@robot.report}"
      end
    end
  end
end

# frozen_string_literal: true

module Application
  class CommandManager
    def initialize(robot:, table:)
      @robot = robot
      @table = table
    end

    def parse(input)
      command, argument = input.to_s.split(' ')

      case command
      when /^PLACE$/i
        Commands::PlaceCommand.new(robot: @robot, table: @table)
      when /^MOVE$/i
        Commands::MoveCommand.new(robot: @robot, table: @table)
      when /^LEFT$/i
        Commands::LeftCommand.new(robot: @robot)
      when /^RIGHT$/i
        Commands::RightCommand.new(robot: @robot)
      when /^REPORT$/i
        Commands::ReportCommand.new(robot: @robot)
      end
    end
  end
end

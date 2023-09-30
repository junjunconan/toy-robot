# frozen_string_literal: true

module Application
  class CommandManager
    def parse(input)
      command, argument = input.to_s.split(' ')

      case command
      when /^PLACE$/i
        Commands::PlaceCommand.new
      when /^MOVE$/i
        Commands::MoveCommand.new
      when /^LEFT$/i
        Commands::LeftCommand.new
      when /^RIGHT$/i
        Commands::RightCommand.new
      when /^REPORT$/i
        Commands::ReportCommand.new
      end
    end
  end
end

# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'application/command_manager'
require 'application/commands/left_command'
require 'application/commands/move_command'
require 'application/commands/place_command'
require 'application/commands/report_command'
require 'application/commands/right_command'

class Main
  def run
    puts 'Please input command (EXIT to quit):'
    puts 'Usage:'
    puts '1. PLACE X,Y,F'
    puts '2. MOVE'
    puts '3. LEFT'
    puts '4. RIGHT'
    puts '5. REPORT'

    manager = Application::CommandManager.new

    loop do
      begin
        input = gets
        manager.parse(input)&.execute
      
        break if input =~ /^EXIT$/i
      rescue StandardError => e
        puts e.message
      end
    end
  end
end

Main.new.run

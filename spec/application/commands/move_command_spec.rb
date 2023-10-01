# frozen_string_literal: true

require 'spec_helper'

describe Application::Commands::MoveCommand do
  let(:robot) { double('Robot', direction: 'NORTH') }
  let(:table) { double('Table') }
  let(:old_position) { double('old_position', new_position_from: true) }
  let(:new_position) { double('new_position', x_coordinate: 2, y_coordinate: 3) }

  subject { Application::Commands::MoveCommand.new(robot: robot, table: table) }

  describe '#execute' do
    context 'success' do
      it 'should move the robot successfully' do
        expect(robot).to receive(:placed?).and_return(true)
        expect(robot).to receive(:position).and_return(old_position)
        expect(old_position).to receive(:new_position_from).with(direction: 'NORTH').and_return(new_position)
        expect(table).to receive(:valid_position?).with(new_position).and_return(true)
        expect(robot).to receive(:move_to).with(new_position: new_position)
        subject.execute
      end
    end

    context 'robot not placed' do
      it 'should ignore the command and raise an error' do
        expect(robot).to receive(:placed?).and_return(false)
        expect(robot).not_to receive(:move_to)
        expect { subject.execute }.to raise_error(StandardError, 'Robot not placed yet')
      end
    end

    context 'new position is invalid' do
      it 'should ignore the command and raise an error' do
        expect(robot).to receive(:placed?).and_return(true)
        expect(robot).to receive(:position).and_return(old_position)
        expect(old_position).to receive(:new_position_from).with(direction: 'NORTH').and_return(new_position)
        expect(table).to receive(:valid_position?).with(new_position).and_return(false)
        expect(robot).not_to receive(:move_to)
        expect { subject.execute }.to raise_error(StandardError, 'Invalid position: 2,3')
      end
    end
  end
end

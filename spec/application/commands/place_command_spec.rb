# frozen_string_literal: true

require 'spec_helper'

describe Application::Commands::PlaceCommand do
  let(:robot) { double('Robot') }
  let(:table) { double('Table') }
  let(:position) { double('Position') }
  let(:x) { '2' }
  let(:y) { '3' }
  let(:direction) { 'NORTH' }

  subject { Application::Commands::PlaceCommand.new(robot: robot, table: table, x: x, y: y, direction: direction) }

  describe '#execute' do
    context 'success' do
      it 'should place the robot successfully' do
        expect(Domain::Position).to receive(:new).and_return(position)
        expect(table).to receive(:valid_position?).with(position).and_return(true)
        expect(robot).to receive(:place).with(position: position, direction: direction)
        subject.execute
      end
    end

    context 'position is invalid' do
      it 'should ignore the command and raise an error' do
        expect(Domain::Position).to receive(:new).and_return(position)
        expect(table).to receive(:valid_position?).with(position).and_return(false)
        expect(robot).not_to receive(:place)
        expect { subject.execute }.to raise_error(StandardError, "Invalid position: #{x},#{y}")
      end
    end

    context 'direction is invalid' do
      let(:direction) { 'invalid_direction' }

      it 'should ignore the command and raise an error' do
        expect(Domain::Position).to receive(:new).and_return(position)
        expect(table).to receive(:valid_position?).with(position).and_return(true)
        expect(robot).not_to receive(:place)
        expect { subject.execute }.to raise_error(StandardError, "Invalid direction: #{direction}")
      end
    end
  end
end

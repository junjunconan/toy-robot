# frozen_string_literal: true

require 'spec_helper'

describe Application::Commands::LeftCommand do
  let(:robot) { double('Robot') }

  subject { Application::Commands::LeftCommand.new(robot: robot) }

  describe '#execute' do
    context 'robot placed' do
      it 'should turn the robot left' do
        expect(robot).to receive(:placed?).and_return(true)
        expect(robot).to receive(:turn_left)
        subject.execute
      end
    end

    context 'robot not placed' do
      it 'should ignore the command and raise an error' do
        expect(robot).to receive(:placed?).and_return(false)
        expect(robot).not_to receive(:turn_left)
        expect { subject.execute }.to raise_error(StandardError, 'Robot not placed yet')
      end
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

describe Application::CommandManager do
  let(:robot) { double('Robot') }
  let(:table) { double('Table') }

  subject { Application::CommandManager.new(robot: robot, table: table) }

  describe '#parse' do
    context 'PLACE command' do
      it do
        expect(Application::Commands::PlaceCommand).to receive(:new).with(robot: robot, table: table, x: '0', y: '0', direction: 'NORTH')

        subject.parse('PLACE 0,0,NORTH')
      end
    end

    context 'MOVE command' do
      it do
        expect(Application::Commands::MoveCommand).to receive(:new).with(robot: robot, table: table)

        subject.parse('MOVE')
      end
    end

    context 'LEFT command' do
      it do
        expect(Application::Commands::LeftCommand).to receive(:new).with(robot: robot)

        subject.parse('LEFT')
      end
    end

    context 'RIGHT command' do
      it do
        expect(Application::Commands::RightCommand).to receive(:new).with(robot: robot)

        subject.parse('RIGHT')
      end
    end

    context 'REPORT command' do
      it do
        expect(Application::Commands::ReportCommand).to receive(:new).with(robot: robot)

        subject.parse('REPORT')
      end
    end

    context 'invalid command' do
      it { expect(subject.parse('invalidcommand')).to be_nil }
      it { expect(subject.parse('')).to be_nil }
      it { expect(subject.parse(nil)).to be_nil }
    end
  end
end

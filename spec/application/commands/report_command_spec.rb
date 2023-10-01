# frozen_string_literal: true

require 'spec_helper'

describe Application::Commands::ReportCommand do
  let(:robot) { double('Robot') }

  subject { Application::Commands::ReportCommand.new(robot: robot) }

  describe '#execute' do
    it do
      expect(robot).to receive(:report).and_return('report_result')
      expect { subject.execute }.to output("Output: report_result\n").to_stdout
    end
  end
end

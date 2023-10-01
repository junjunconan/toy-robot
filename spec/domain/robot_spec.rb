# frozen_string_literal: true

require 'spec_helper'

describe Domain::Robot do
  let(:position) { Domain::Position.new(0, 0) }
  let(:direction) { 'NORTH' }

  subject { Domain::Robot.new(position: position, direction: direction) }

  describe '#place' do
    let(:new_position) { Domain::Position.new(2, 3) }
    let(:new_direction) { 'EAST' }

    it do
      expect { subject.place(position: new_position, direction: new_direction) }
        .to change { subject.position }.from(position).to(new_position)
        .and change { subject.direction }.from(direction).to(new_direction)
    end
  end

  describe '#placed?' do
    context 'when placed' do
      it { expect(subject.placed?).to eq true }
    end

    context 'when position is nil' do
      let(:position) { nil }
      it { expect(subject.placed?).to eq false }
    end

    context 'when direction is nil' do
      let(:direction) { nil }
      it { expect(subject.placed?).to eq false }
    end
  end

  describe '#move_to' do
    let(:new_position) { Domain::Position.new(2, 3) }

    it do
      expect { subject.move_to(new_position: new_position) }
        .to change { subject.position }.from(position).to(new_position)
    end
  end

  describe '#turn_left' do
    it do
      expect { subject.turn_left }.to change { subject.direction }.from('NORTH').to('WEST')
    end
  end

  describe '#turn_right' do
    it do
      expect { subject.turn_right }.to change { subject.direction }.from('NORTH').to('EAST')
    end
  end

  describe '#report' do
    context 'when placed' do
      it do
        expect(subject).to receive(:placed?).and_return(true)
        expect(subject.report).to eq '0,0,NORTH'
      end
    end

    context 'when not placed' do
      it do
        expect(subject).to receive(:placed?).and_return(false)
        expect(subject.report).to eq 'Not placed yet'
      end
    end
  end
end

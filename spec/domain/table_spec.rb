# frozen_string_literal: true

require 'spec_helper'

describe Domain::Table do
  subject { Domain::Table.new(width: 5, height: 5) }

  describe '#valid_position?' do
    context 'valid position' do
      it { expect(subject.valid_position?(Domain::Position.new(2, 3))).to eq true }
      it { expect(subject.valid_position?(Domain::Position.new(0, 4))).to eq true }
      it { expect(subject.valid_position?(Domain::Position.new(4, 0))).to eq true }
    end

    context 'invalid position' do
      it { expect(subject.valid_position?(Domain::Position.new(-1, 3))).to eq false }
      it { expect(subject.valid_position?(Domain::Position.new(2, -1))).to eq false }
      it { expect(subject.valid_position?(Domain::Position.new(2, 5))).to eq false }
      it { expect(subject.valid_position?(Domain::Position.new(5, 3))).to eq false }
    end
  end
end

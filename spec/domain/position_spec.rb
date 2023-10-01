# frozen_string_literal: true

require 'spec_helper'

describe Domain::Position do
  describe '#valid?' do
    it { expect(Domain::Position.new(2, 3).valid?).to eq true }
    it { expect(Domain::Position.new(2, nil).valid?).to eq false }
    it { expect(Domain::Position.new(nil, 3).valid?).to eq false }
    it { expect(Domain::Position.new('2', 3).valid?).to eq false }
    it { expect(Domain::Position.new(2, '3').valid?).to eq false }
    it { expect(Domain::Position.new(2.2, 3).valid?).to eq false }
  end

  describe '#new_position_from' do
    let(:step) { 2 }
    let(:direction) { nil }
    let(:position) { Domain::Position.new(2, 3) }

    context 'valid direction' do
      before do
        @new_position = position.new_position_from(direction: direction, step: step)
        expect(@new_position).not_to be(position)
      end

      context 'move NORTH' do
        let(:direction) { 'NORTH' }

        it do
          expect(@new_position.x_coordinate).to eq 2
          expect(@new_position.y_coordinate).to eq 5
        end
      end

      context 'move EAST' do
        let(:direction) { 'EAST' }

        it do
          expect(@new_position.x_coordinate).to eq 4
          expect(@new_position.y_coordinate).to eq 3
        end
      end

      context 'move SOUTH' do
        let(:direction) { 'SOUTH' }

        it do
          expect(@new_position.x_coordinate).to eq 2
          expect(@new_position.y_coordinate).to eq 1
        end
      end

      context 'move WEST' do
        let(:direction) { 'WEST' }

        it do
          expect(@new_position.x_coordinate).to eq 0
          expect(@new_position.y_coordinate).to eq 3
        end
      end
    end

    context 'invalid direction' do
      let(:direction) { 'invalid_direction' }

      it do
        expect { position.new_position_from(direction: direction, step: step) }.to raise_error(StandardError, 'Invalid direction')
      end
    end
  end
end

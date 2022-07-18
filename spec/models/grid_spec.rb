require 'spec_helper'

RSpec.describe Grid do
  subject do
    described_class.new(width: 8, height: 8)
  end

  describe '#cells' do
    it 'returns the cells associated with the grid' do
      expect(subject.cells[[0,0]].grid).to eq(subject)
    end
  end

  describe '#cell_at' do
    it 'returns the cell of given (x,y) coordinate' do
      expect(subject.cell_at(1,1)).to eq(subject.cells[[1,1]])
    end
  end

  # TODO: Fix flaky tests.
  describe '#next_step!' do
    let(:cell) { subject.cell_at(4,4) }

    context 'when cell is alive' do

      before do
        cell.live!
        cell.alive_neighbours.each(&:dead!)
      end

      it 'maintains cells on to next step when alive neighbours population is two or three' do
        expect(cell.live?).to be_truthy
        expect(cell.alive_neighbours.size).to eq(0)
        expect{

          cell.neighbours.first(3).each(&:live!)

        }.to change{ cell.alive_neighbours.size }.from(0).to(3)

        expect{

          subject.next_step!

        }.not_to change{ cell.live? }
      end

      it 'kills cells by underpopulation' do
        expect(cell.live?).to be_truthy
        expect(cell.alive_neighbours.size).to eq(0)
        expect{

          cell.neighbours.first(1).each(&:live!)

        }.to change{ cell.alive_neighbours.size }.from(0).to(1)

        expect{

          subject.next_step!

        }.to change{ cell.live? }.from(true).to(false)
      end

      it 'kills cells by overpopulation' do
        expect(cell.live?).to be_truthy
        expect(cell.alive_neighbours.size).to eq(0)
        expect{

          cell.neighbours.first(4).each(&:live!)

        }.to change{ cell.alive_neighbours.size }.from(0).to(4)

        expect{

          subject.next_step!

        }.to change{ cell.live? }.from(true).to(false)
      end
    end

    # TODO: Fix flaky test.
    context 'when cell is dead' do
      before do
        cell.dead!
        cell.alive_neighbours.each(&:dead!)
      end

      it 'revive cells by reproduction' do
        expect(cell.dead?).to be_truthy
        expect(cell.alive_neighbours.size).to eq(0)
        expect{

          cell.neighbours.first(3).each(&:live!)

        }.to change{ cell.alive_neighbours.size }.from(0).to(3)

        expect{

          subject.next_step!

        }.to change{ cell.live? }.from(false).to(true)
      end
    end
  end

  describe 'validations' do
    it 'is valid with height and width values' do
      expect{

        Grid.new(width: 8, height: 8)

      }.not_to raise_error
    end

    it 'is not valid without height' do
      expect{

        Grid.new(width: 8)

      }.to raise_error ArgumentError
    end

    it 'is not valid without width' do
      expect{

        Grid.new(height: 8)

      }.to raise_error ArgumentError
    end
  end

  describe 'default values' do
    it 'contains the correct quantity of cells' do
      expect(subject.cells.size).to eq(subject.width * subject.height)
    end
  end
end

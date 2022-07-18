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

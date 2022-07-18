require 'spec_helper'

RSpec.describe Cell do
  let(:grid) { Grid.new(width: 8, height: 8) }
  subject{ grid.cell_at(1, 1) }

  describe '#live?' do
    it 'returns true if cell is alive' do
      subject.live!

      expect(subject.live?).to be_truthy
    end

    it 'returns false if cell is dead' do
      subject.dead!

      expect(subject.live?).to be_falsey
    end
  end

  describe '#live!' do
    it 'brings a cell to life' do
      subject.dead!
      expect{

        subject.live!

      }.to change{ subject.live? }.from(false).to(true)
    end
  end

  describe '#dead?' do
    it 'returns true if cell is dead' do
      subject.dead!

      expect(subject.dead?).to be_truthy
    end

    it 'returns false if cell is alive' do
      subject.live!

      expect(subject.dead?).to be_falsey
    end
  end

  describe '#dead!' do
    it 'kills a cell' do
      subject.live!
      expect{

        subject.dead!

      }.to change{ subject.dead? }.from(false).to(true)
    end
  end

  describe '#swap!' do
    it 'changes to the opposite life status of a cell' do
      subject.live!
      expect{

        subject.swap!

      }.to change{ subject.live? }.from(true).to(false)
    end
  end

  describe 'validations' do
    let(:grid) { Grid.new(width: 8, height: 8) }

    it 'is valid with (x,y) coordinates and a grid' do
      expect{

        Cell.new(pos_x: 1, pos_y: 1, grid: grid)

      }.not_to raise_error
    end

    it 'is not valid without a y coordinate' do
      expect{

        Cell.new(pos_x: 1, grid: grid)

      }.to raise_error ArgumentError
    end

    it 'is not valid without a x coordinate' do
      expect{

        Cell.new(pos_y: 1, grid: grid)

      }.to raise_error ArgumentError
    end

    it 'is not valid without a grid' do
      expect{

        Cell.new(pos_x: 1, pos_y: 1)

      }.to raise_error ArgumentError
    end
  end

  describe 'default values' do
  end
end

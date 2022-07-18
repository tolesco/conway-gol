class Grid
  attr_reader :width, :height
  attr_accessor :cells

  def initialize(width:, height:)
    @width, @height = width, height
    @cells = {}
    populate_cells
  end

  def cell_at(x,y)
    cells[[x,y]]
  end

  def next_step!
    @width.times do |x|
      @height.times do |y|
        cell = self.cell_at(x,y)
        alive_neighbours = cell.alive_neighbours.size
        if cell.live?
          cell.swap! if alive_neighbours < 2 || alive_neighbours > 3
        else
          cell.swap! if alive_neighbours == 3
        end
      end
    end
  end

  private

  def populate_cells
    width.times do |x|
      height.times do |y|
        cells[[x, y]] = Cell.new(pos_x: x, pos_y: y, grid: self)
      end
    end
  end
end

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
    to_swap = []
    @width.times do |x|
      @height.times do |y|
        cell = cell_at(x, y)
        n = cell.alive_neighbours.size
        to_swap << cell if (cell.live? && (n < 2 || n > 3)) || (cell.dead? && n == 3)
      end
    end
    to_swap.each(&:swap!)
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

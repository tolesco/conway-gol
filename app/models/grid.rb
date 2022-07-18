class Grid
  attr_reader :width, :height

  def initialize(width:, height:)
    @width, @height = width, height
    @cells = {}
    populate_cells
  end

  def cells
    @cells
  end

  def cell_at(x,y)
    cells[[x,y]]
  end

  private

  def populate_cells
    width.times do |x|
      height.times do |y|
        @cells[[x, y]] = Cell.new(pos_x: x, pos_y: y, grid: self)
      end
    end
  end
end

class Cell
  attr_reader :pos_x, :pos_y, :grid

  def initialize(pos_x:, pos_y:, grid:)
    @pos_x = pos_x
    @pos_y = pos_y
    @grid = grid
    @live = [true, false].sample
  end

  def live?
    @live
  end

  def live!
    @live = true
  end

  def dead?
    !@live
  end

  def dead!
    @live = false
  end

  def swap!
    @live = !@live
  end

  def neighbours
    # Each cell interacts with the eight neighbour cells:
    # |1|2|3|
    # |4|*|5|
    # |6|7|8|
    neighbours = []
    neighbours << @grid.cell_at(@pos_x-1, @pos_y-1) # Top Left
    neighbours << @grid.cell_at(@pos_x,   @pos_y-1) # Top
    neighbours << @grid.cell_at(@pos_x+1, @pos_y-1) # Top Right
    neighbours << @grid.cell_at(@pos_x+1, @pos_y)   # Right
    neighbours << @grid.cell_at(@pos_x+1, @pos_y+1) # Bottom Right
    neighbours << @grid.cell_at(@pos_x,   @pos_y+1) # Bottom
    neighbours << @grid.cell_at(@pos_x-1, @pos_y+1) # Bottom Left
    neighbours << @grid.cell_at(@pos_x-1, @pos_y)   # Left

    neighbours
  end

  def alive_neighbours
    neighbours.select{ |cell| cell && cell.live? }
  end
end

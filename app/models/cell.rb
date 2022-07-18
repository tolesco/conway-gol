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
end

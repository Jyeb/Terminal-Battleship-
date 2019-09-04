class Ship 
  attr_accessor :pos_hit, :size, :pos
  def initialize(pos, size)
    @pos = pos 
    @size = size
    @pos_hit = 0
  end

  def carriers
    new([[0,0],[0,1],[0,2],[0,3],[0,4]], 5)
  end

  def battleships
    new([[1,0],[1,1],[1,2],[1,3]], 4)
  end

  def cruisers
    new([[2,0],[2,1],[2,2]], 3)
  end

  def submarines 
    new([[3,0],[3,1],[3,2]], 3)
  end

  def destroyers 
    new([[4,0],[4,1]], 2)
  end
end

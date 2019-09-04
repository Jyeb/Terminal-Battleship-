class Ship 
  attr_accessor :pos_hit, :size, :pos
  def initialize(pos, size)
    @pos = pos 
    @size = size
    @pos_hit = 0
  end

  def carrier
    new([0,0], 5)
  end

  def battleship
    new([1,0], 4)
  end

  def cruiser 
    new([2,0], 3)
  end

  def submarine 
    new([3,0], 3)
  end

  def destroyer 
    new([4,0], 2)
  end
end

class Ship 
  @@rand = [0,1,2,3].sample
  @@cprand = [0,1,2,3].sample
  def carriers(random)
    boards = 
    [
    [[2,1],[2,2],[2,3],[2,4],[2,5]], 
    [[7,3],[7,4],[7,5],[7,6],[7,7]],
    [[1,5],[2,5],[3,5],[4,5],[5,5]],
    [[0,9],[1,9],[2,9],[3,9],[4,9]]
    ]
    boards[random]
  end

  def battleships(random)
    boards = 
    [
    [[5,4],[6,4],[7,4],[8,4]], 
    [[6,5],[5,5],[4,5],[3,5]],
    [[6,3],[6,4],[6,5],[6,6]],
    [[9,1],[9,2],[9,3],[9,4]]
    ]
    boards[random]
  end

  def cruisers(random)
    boards = 
    [
    [[1,1],[1,2],[1,3]], 
    [[0,9],[1,9],[2,9]],
    [[0,2],[1,2],[2,2]],
    [[0,2],[1,2],[2,2]]
    ]
    boards[random]
  end

  def submarines(random)
    boards = 
    [
    [[3,8],[4,8],[5,8]], 
    [[9,5],[9,6],[9,7]],
    [[8,6],[8,7],[8,8]],
    [[5,4],[5,5],[5,6]]
    ]
    boards[random]
  end

  def destroyers(random)
    boards = 
    [
    [[4,2],[5,2]], 
    [[0,8],[1,8]],
    [[5,1],[5,2]],
    [[5,1],[5,2]]
    ]
    boards[random]
  end
end
require 'test/unit'
require_relative 'gamelogic'

class GamelogicTest < Test::Unit::TestCase
  def setup 
    @ship = Ship.new
    @carriers = @ship.carriers(0)
    @battleships = @ship.battleships(0)
    @cruisers = @ship.cruisers(0)
    @submarines = @ship.submarines(0)
    @destroyers = @ship.destroyers(0)
  end

  def test_board_selection
    assert_equal([[2,1],[2,2],[2,3],[2,4],[2,5]], @carriers)
    assert_equal([[5,4],[6,4],[7,4],[8,4]],@battleships)
    assert_equal([[1,1],[1,2],[1,3]],@cruisers)
    assert_equal([[3,8],[4,8],[5,8]], @submarines)
    assert_equal([[4,2],[5,2]], @destroyers)
  end
end
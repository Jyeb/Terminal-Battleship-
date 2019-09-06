require 'test/unit'
require_relative 'gamelogic'

class Game_logic_Test < Test::Unit::TestCase
  def setup 
    @game = Game.new
    @ship_count = @game.player_ship_at_pos.flatten
    @cp_ship_count = @game.cp_ship_at_pos.flatten
  end

  def test_alphanumeric_coversion
    assert_equal([0,4], @game.player_turn("A5"))
    assert_equal([0,6], @game.player_turn("A7"))
    assert_equal([2,0], @game.player_turn("C1"))
  end

  def test_player_ship_count
    assert_equal(17, @ship_count.count("occupied"))
  end

  def test_cp_ship_count
    assert_equal(17, @cp_ship_count.count("occupied"))
  end
end
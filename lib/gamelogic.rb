require 'curses'
require_relative 'players'
class Game < Players
  def initialize 
    @letters = [*'A'..'J']
    @numbers = [*'1'..'10']
    @grid = create_grid
    player_one
    @player_ships = player_ships
    @cp_ships = cp_ships
    @board_positions = board_positions
    @cp_ship_at_pos = cp_ship_at_pos
    @player_ship_at_pos = player_ship_at_pos
  end

  def create_grid 
    Array.new(10){Array.new(10)}
  end

  def board_positions
    positions = []
    for i in 0...@letters.length
      positions << @numbers.map { |number| @letters[i] + number }
    end
    positions
  end

  def player_ships
    [
      @carrier,
      @battleship,
      @cruiser,
      @submarine,
      @destroyer
    ]
  end
  
  def cp_ships 
    [
      @carrier,
      @battleship,
      @cruiser,
      @submarine,
      @destroyer
    ]
  end 

  def ships_at_pos(player)
    grid = @grid.dup
    player.each do |ship|
      ship.each do |array|
        grid[array[0]][array[1]] = "occupied"
      end
    end
    grid
  end

  def cp_ship_at_pos
    ships_at_pos(@cp_ships)
  end

  def player_ship_at_pos
    ships_at_pos(@player_ships)
  end

  def player_turn(player_input)
    user_input = player_input
    arr_index = @board_positions.find_index { |arr| arr.include?(user_input)}
    item_index = @board_positions[arr_num].index(user_input)
    return arr_index, item_index
  end  

  def collision_detection(player_input)
    relative_index = player_turn(player_input)
    if @cp_ship_at_pos[relative_index[0]][relative_index[1]] == "occupied"
      @cp_ship_at_pos[relative_index[0]][relative_index[1]] = "HIT"
    end
  end
end
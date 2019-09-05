require 'curses'
require_relative 'ships'
class Game_logic < Ship
  attr_accessor :letters, :numbers, :grid
  def initialize 
    @grid = create_grid
    @ships = create_ships
    @letters = [*'A'..'J']
    @numbers = [*'1'..'10']
    @selectloc = create_positions
    @occupied = occupied
  end
  def create_grid
    Array.new(10){Array.new(10)}
  end

  def create_positions
    positions = []
    for i in 0..letters.length-1
      positions << @numbers.map { |number| @letters[i] + number }
    end
    positions
  end

  def create_ships
    [
    Ship.carriers,
    Ship.battleships,
    Ship.cruisers,
    Ship.submarines,
    Ship.destroyers
    ]
  end

  def occupied
    grid = @grid.dup
    @ships.each do |ship|
      ship.pos.each do |array|
          grid[array[0]][array[1]] = "occupied"
      end
    end
    grid
  end

  def alphan_index(lett_inp, int_inp)
    user_value = lett_inp + int_inp.to_s
    arr_num = @selectloc.find_index { |arr| arr.include?(user_value)}
    ind_num = @selectloc[arr_num].index(user_value)
    return arr_num, ind_num
  end

  def gameplay(lett_inp, int_inp)
    ind_pos = alphan_index(lett_inp, int_inp)
    if @occupied[ind_pos[0]][ind_pos[1]] == "occupied"
      @occupied[ind_pos[0]][ind_pos[1]] = "HIT"
    else 
      return "MISS"
    end
    "HIT"
  end

end

require 'curses'
require_relative 'ships'
class Game_logic < Ship
  attr_accessor :letters, :numbers, :grid
  def initialize 
    @grid = create_grid
    @ships = create_ships
    @letters = [*'A'..'J']
    @numbers = [*'1'..'10']
  end
  def create_grid
    Array.new(10){Array.new(10)}
  end

  def create_positions
    positions = []
    for i in 0..letters.length-1
      positions << @numbers.map { |number| @letters[i] + number }
    end
    positions.flatten!
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

  def selection
    grid = @grid.dup

    @ships.each do |ship|
      ship.pos.each do |array|
          grid[array[0]][array[1]] = "occupied"
      end
    end
    grid
  end

  def gameplay 
    selection
  end

end

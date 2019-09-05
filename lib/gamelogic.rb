require 'curses'
require_relative 'ships'
class Game_logic < Ship
  attr_accessor :letters, :numbers, :ships, :grid
  def initialize 
    @grid = create_grid
    @ships = create_ships
    @letters = [*'A'..'J']
    @numbers = [*'1'..'10']
  end
  def create_grid
    grid = [] 
    for y in 0..9 
      for x in 0..9 
        grid << [y,x] 
      end
    end
    grid
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

  def selection(input)
    ships.each.with_index do |item, y|
      item.pos.each do |array|
        array.each do |location|
          grid.each do |relative|
            if relative == location
              relative = "occupied"
          end
        end
      end
    end
  end

  def gameplay 
  end
end

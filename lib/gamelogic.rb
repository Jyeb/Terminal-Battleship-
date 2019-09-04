require 'curses'
require_relative 'ships'
class Game_logic < Ship
  def initialize 
    @grid = create_grid
    @ships = create_ships
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

  def create_ships
    [
    Ship.carriers,
    Ship.battleships,
    Ship.cruisers,
    Ship.submarines,
    Ship.destroyers
    ]
  end

  def gameplay 
    
  end
end

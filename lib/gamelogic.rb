require 'curses'
require_relative 'ships'
class Game_logic < Ship
  def create_grid
    @grid = [] 
    for y in 0..9 
      for x in 0..9 
        @grid << [y,x] 
      end
    end
    @grid
  end

  def create_ships
    carrier = Ship.carriers,
    battleship = Ship.battleships,
    cruiser = Ship.cruisers,
    submarine = Ship.submarines,
    destroyer = Ship.destroyers
    @create_ships = [
      carrier,
      battleship,
      cruiser,
      submarine, 
      destroyer   
  ]
  end
end

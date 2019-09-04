require 'curses'
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

  def append_ships
    @create_ships = [
    Ship.carrier,
    Ship.battleship,
    Ship.cruiser,
    Ship.submarine,
    Ship.destroyer
  ]
  end
end

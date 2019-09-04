require 'curses'
class Game_logic < ships
  def initialize 
  end

  def create_grid
    grid = [] 
    for y in 0..9 
      for x in 0..9 
        grid << [y,x] 
      end
    end
  end
end

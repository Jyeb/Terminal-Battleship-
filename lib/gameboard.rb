require 'curses'
require_relative 'gamelogic'

class Board < Game
  def initialize(top, left)
    super()
    Curses.init_screen
    Curses.noecho
    Curses.curs_set(0)
    @top = top
    @left = left 
    @rows = Curses.lines 
    @cols = Curses.cols 
    @win = Curses::Window::new(@rows,@cols,@top,@left)
    @win.keypad = true
    @win.nodelay = false
    @centre_x = @win.maxx/2
    @centre_y = @win.maxy/2
    Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_RED)
    win.attron(Curses.color_pair(1))
  end

  def split_screen 
    @win.clear 
    @leftscreen = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
    @rightscreen = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
    loop do 
      @leftscreen.box("|","-")
      @rightscreen.box("|", "-")
      create_boards
      append_ships
      @win.refresh
    end 
  end 

  def create_boards
    @leftscreen.setpos(4,10) 
    @letters.each do |i|
      @leftscreen << i + " "
    end
    @numbers.each.with_index do |item, x|
      @leftscreen.setpos(5+x,8)
      @leftscreen << item
    end

    @rightscreen.setpos(4,10)
    @letters.each do |items|
      @rightscreen << items + " "
    end
    @numbers.each.with_index do |item, i|
      @rightscreen.setpos(5+i,8)
      @rightscreen << item 
    end
  end

  def append_ships
    colors = []
    player_win = @leftscreen.subwin(10,20,5,11)
    @player_ships.each do |ships|
      ships.each do |positions|
        player_win.setpos(positions[0], positions[1]*2 -1)
        player_win << "S"
      end
    end
  end
end

#   def append_ships 
#     shipwin = @win.subwin(10,20,5,10)
#     shipchars = ["C","B","R","S","D"]
#     loop do
#       @ships.each.with_index do |item, y|
#         item.pos.each.with_index do |array, i|
#           shipwin.setpos(array[0],array[1] + i)
#           shipwin << shipchars[y]
#         end
#         shipwin.refresh
#       end
#     end
#   def 
#     loop do
#       entry = "Please enter coordinates: "
#       @win.setpos(@centre_y + @centre_y/2, @centre_x - @centre_x/2 - entry.length/2 )
#       @win << entry
#       letter, number = @win.getch, @win.getch 
#       @win << letter.upcase + number
#       @win.refresh
#       gameplay(letter.upcase,number.upcase)
#       @win << @occupied.to_s
#       @win.refresh
#     end
#   end

# end

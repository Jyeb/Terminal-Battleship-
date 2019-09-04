require 'curses'
require_relative 'gamelogic'
class Board < Game_logic
  attr_accessor :positions
  def initialize(top, left)
    Curses.init_screen
    Curses.noecho
    Curses.curs_set(0)
    @top = top
    @left = left
    @rows = Curses.lines
    @cols = Curses.cols
    @win = Curses::Window::new(@rows,@cols,@top,@left)
    @letters = [*'A'..'J']
    @numbers = [*'1'..'10']
    @win.keypad = true
    @win.nodelay = false
  end

  def controls 
    @win.clear
    loop do
      str = "Insert Game Controls"
      @win.setpos(@win.maxy/2, @win.maxx/2 - str.length/2 )   
      @win.addstr(str) 
      @win.refresh
      @win.getch
    end
  end

  def create_positions
    positions = []
    for i in 0..letters.length-1
      positions << @numbers.map { |number| @letters[i] + number }
    end
    positions.flatten!
  end

  def game_board
    @win.clear
    @player_board = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
    @player_board.setpos(4,10)
    for each in @letters 
      player_board << each + " "
    end
    x = 0
    for i in @numbers
      x+=1
      @player_board.setpos(4+x,7)
      @player_board << i + "\n"
    end
    @player_board.box("|","-")
    @player_board.refresh
    @computer_board = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
    @computer_board.setpos(4,10)
    for i in @letters 
      @computer_board << i + " "
    end
    x = 0
    for i in @numbers
      x+=1
      @computer_board.setpos(4+x,7)
      @computer_board << i + "\n"
    end
    @computer_board.box("|", "-")
    @win.refresh
    @computer_board.getch
  end

  def append_ships
    swin = @playerboard.subwin(10,20,5,10)
    create_ships.each do |item|

    end
  end
end

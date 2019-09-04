require 'curses'

class Board
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
      str = "Press start game to begin the setup process.\nEnter Alphanumeric coordinates to select each ships position on the board [A1]-[J10] for location, [L][R][U][D] for direction.\nUsing the keyboard, make your turn by guessing the location of the enemy ships [A1]-[J10]"
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
    player_board = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
    player_board.setpos(4,10)
    for each in @letters 
      player_board << each + " "
    end
    x = 0
    for i in @numbers
      x+=1
      player_board.setpos(4+x,7)
      player_board << i + "\n"
    end
    player_board.box("|","-")
    # player_board.refresh
    computer_board = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
    computer_board.setpos(4,10)
    for i in @letters 
      computer_board << i + " "
    end
    x = 0
    for i in @numbers
      x+=1
      computer_board.setpos(4+x,7)
      computer_board << i + "\n"
    end
    computer_board.box("|", "-")
    @win.refresh
    computer_board.getch
  end
end


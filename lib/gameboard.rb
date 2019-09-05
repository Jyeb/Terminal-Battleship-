require 'curses'
require_relative 'gamelogic'

class Board < Game_logic
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
  end

  def controls 
    @win.clear
    instructions = 
    [
      "Instructions",
      "From the menu, press start game to begin the game.", 
      "Enter the desired coordinates of your ships using the keyboard [A1]-[J10].",
      "Guess the coordinates of the enemy ships.",
      "Press [P] to pause the game.",
      "Press [ENTER] to return to the main menu"
    ]
 
    loop do
      instructions.each_with_index do |item, i|
        @win.setpos(@centre_y + i, @centre_x - item.length/2)
        @win << item
      end
      @win.refresh
      case @win.getch
      when Curses::KEY_ENTER, 10
        break
      end
    end
    @win.clear
    options
  end

  def game_board
    @win.clear
    loop do 
      @player_board = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
      @player_board.setpos(4,10)
      @letters.each do |i|
        @player_board << i + " "
      end

      @numbers.each.with_index do |item, x|
        @player_board.setpos(5+x,8)
        @player_board << item
      end

      @computer_board = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
      @computer_board.setpos(4,10)
      @letters.each do |items|
        @computer_board << items + " "
      end
      @numbers.each.with_index do |item, i|
        @computer_board.setpos(5+i,8)
        @computer_board << item + "\n"
      end

      @player_board.box("|","-")
      @computer_board.box("|", "-")
      @win.refresh
      append_ships
    end
  end

  def append_ships 
    shipwin = @win.subwin(10,20,5,10)
    shipchars = ["C","B","R","S","D"]
    loop do
      @ships.each.with_index do |item, y|
        item.pos.each.with_index do |array, i|
          shipwin.setpos(array[0],array[1] + i)
          shipwin << shipchars[y]
        end
        shipwin.refresh
      end
      test
    end
  end

  def test
      entry = "Please enter coordinates: "
      @win.setpos(@centre_y + @centre_y/2, @centre_x - @centre_x/2 - entry.length/2 )
      @win << entry
      letter, number = @win.getch, @win.getch
      @win << letter.upcase + number
      @win.refresh
      gamer = gameplay(letter.upcase,number.upcase)
      @win << gamer.to_s
      @win.refresh
  end

end

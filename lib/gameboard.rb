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
    centre_x = @win.maxx/2
    centre_y = @win.maxy/2
    instructions = 
    [
      "From the menu, press start game to begin the game.", 
      "Enter the desired coordinates of your ships using the keyboard [A1]-[J10].",
      "Guess the coordinates of the enemy ships.",
      "Press [P] to pause the game."
    ]
 
    loop do
      instructions.each_with_index do |item, i|
        @win.setpos(centre_y + i, centre_x - item.length/2)
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

  def create_positions
    positions = []
    for i in 0..letters.length-1
      positions << @numbers.map { |number| @letters[i] + number }
    end
    positions.flatten!
  end

  def game_board
    @win.clear
    loop do 
      @player_board = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
      @player_board.setpos(4,10)
      @letters.each do |i|
        @player_board << i + " "
      end

      x = 0
      @numbers.each do |i|
        x += 1 
        @player_board.setpos(4+x,7)
        @player_board << i + "\n"
      end

      @player_board.box("|","-")
      @player_board.refresh
      @computer_board = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
      @computer_board.setpos(4,10)

      @letters.each do |i|
        @computer_board << i + " "
      end

      x = 0
      @numbers.each do |i|
        x += 1
        @computer_board.setpos(4+x,7)
        @computer_board << i + "\n"
      end
      @computer_board.box("|", "-")
      @win.refresh
      @computer_board.getch
    end
  end
end






  
# def append_ships
#   swin = @win.subwin(10,20,5,10)
  
#   create_ships.each do |item|
#     item.each do |x|
#       swin.setpos(x)
#       swin << "X" + " "
#     end
#   end
#   swin.refresh
#   swin.getch
# end
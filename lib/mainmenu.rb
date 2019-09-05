require 'curses'
require_relative 'gameboard'

class Mainmenu < Board
  include Curses
  def initialize(top, left)
    super
    @selected = 0
    @options = ["Start Game", "Controls", "Exit",]
  end

  def exit_game(leave)
    @win.clear
    @win.setpos(@centre_y, @centre_x - leave.length/2)
    @win << leave
    @win.refresh
    sleep(2)
    exit
  end
  
  def options 
    loop do  
      welcome = "Welcome to Battleships, please select an option"
      @win.setpos(@centre_y - 2 , @centre_x - welcome.length/2)
      @win << welcome
      @options.each.with_index do |option, i|
        @win.attron(Curses::A_STANDOUT) if i == @selected % @options.length
        @win.setpos(@centre_y + i, @centre_x - option.length/2)
        @win << option
        @win.attroff(Curses::A_STANDOUT) if i == @selected % @options.length
      end
      @win.refresh
      case @win.getch
      when Curses::KEY_DOWN
        @selected += 1
      when Curses::KEY_UP
        @selected -= 1
      when Curses::KEY_ENTER, 10
        @selected % @options.length == 2 ? exit_game("Thankyou for playing!") : @selected % @options.length == 1 ? controls : break 
      end
    end
    game_board
  end
end
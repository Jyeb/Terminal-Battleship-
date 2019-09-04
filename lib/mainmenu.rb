require 'curses'
require_relative 'gameboard'

class Mainmenu < Board
  include Curses
  def initialize(top, left)
    super
    @selected = 0
    @options = ["Start Game", "Controls", "Exit",]
  end

  def options 
    loop do
      centre_x = @win.maxx/2
      centre_y = @win.maxy/2
      @options.each.with_index do |option, i|
        @win.attron(Curses::A_STANDOUT) if i == @selected % @options.length
        @win.setpos(centre_y + i, centre_x - option.length/2)
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
        @selected % @options.length == 2 ? exit : @selected % @options.length == 1 ? controls : break 
      end
    end
    game_board
  end
end

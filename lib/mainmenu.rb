require 'curses'
require 'artii'
require_relative 'gameboard'

# Main menu class
class Mainmenu < Board
  include Curses
  def initialize(top, left)
    super
    @selected = 0
    @options = ["Start Game", "Controls", "Exit",]
  end
  # create method for functional user interaction with the main menu screen
  def options 
    loop do  
      welcome = Artii::Base.new.asciify("Welcome to Battleships")
      welcome_the_sequel = Artii::Base.new.asciify("please select an option")
      welcome.split("\n").each.with_index do |line, i|
        @win.setpos(@centre_y - 10 + i, 13)
        @win << line
      end
      welcome_the_sequel.split("\n").each.with_index do |line, i|
        @win.setpos(@centre_y + 5 + i, 15)
        @win << line
      end
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
    split_screen
  end
  #controls menu, explaining game operation
  def controls 
    @win.clear 
    instructions = 
    [
      "Instructions:",
      "  ", 
      "Select [Start Game] to begin the game", 
      "  ", 
      "Guess the Alphanumeric Coordinates of the enemy ships [A1] - [J10]",
      "  ", 
      "The first player to destroy all enemy ships wins",
      "  ",
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
  end
end
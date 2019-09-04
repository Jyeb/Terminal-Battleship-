require 'curses'
require_relative 'mainmenu'

loop do 
  start = Mainmenu.new(0,0)
  start.options
end
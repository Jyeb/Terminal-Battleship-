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
    # Curses.init_pair(1, Curses::COLOR_RED, Curses::COLOR_RED)
    # win.attron(Curses.color_pair(1))
  end

  def split_screen 
    @win.clear 
    @leftscreen = @win.subwin(@win.maxy, @win.maxx/2, 0, 0)
    @rightscreen = @win.subwin(@win.maxy, @win.maxx/2, 0, @win.maxx/2)
    turn = 0 
    loop do 
      @win.clear
      @leftscreen.box("|","-")
      @rightscreen.box("|", "-")
      create_boards
      append_ships
      append_cp_ships
      if turn % 2 == 0
        player_display
      else
        cp_display
      end
      turn += 1
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
        if @player_ship_at_pos[positions[1]][positions[0]] == 'HIT'
          player_win << "H"
        else
          player_win << "S"
        end
      end
    end
  end

  def append_cp_ships
    colors = []
    @cp_win = @rightscreen.subwin(10,20,5,@win.maxx/2 + 11)
    @cp_ships.each do |ships|
      ships.each do |positions|
        @cp_win.setpos(positions[0], positions[1]*2 -1)
        if @cp_ship_at_pos[positions[1]][positions[0]] == 'HIT'
          @cp_win << "H"
        end
      end
    end
  end

  def player_display
    score = 0
    user_prompt = "Please enter Coordinates: "
    @win.setpos(@centre_y + @centre_y/2, @centre_x - @centre_x/2 - user_prompt.length/2 )
    @win << user_prompt
    @win.refresh
    coordinate = @win.getstr.upcase
    collision_detection(coordinate)
    @win.setpos(@centre_y + @centre_y/2 + 1, @centre_x - @centre_x/2 - 1)
    @win << coordinate
    @win.refresh
    sleep(1)
  end

  def cp_display
    cp_message = "Is your ship at..."
    @win.setpos(@centre_y + @centre_y/2, @centre_x - @centre_x/2 - cp_message.length/2)
    @win << cp_message
    @win.refresh
    cp_coord = @board_positions.flatten.sample
    cp_collision_detection(cp_coord)
    @win.setpos(@centre_y + @centre_y/2 + 1, @centre_x - @centre_x/2 - 1)
    @win << cp_coord
    @win.refresh
    sleep(1)
  end
end

require_relative 'ships'

class Players < Ship
  def initialize 
    @ships_remaining = 5 
  end

  def player_one 
    @carrier = Ship.new("Carrier").carriers(@@rand)
    @battleship = Ship.new("Battleship").battleships(@@rand)
    @cruiser = Ship.new("Cruiser").cruisers(@@rand)
    @submarine = Ship.new("Submarine").submarines(@@rand)
    @destroyer = Ship.new("Destroyer").destroyers(@@rand)
  end

  def computer_player
    @carrier_cp = Ship.new("Carrier").carriers(@@cprand)
    @battleship_cp = Ship.new("Battleship").battleships(@@cprand)
    @cruiser_cp = Ship.new("Cruiser").cruisers(@@cprand)
    @submarine_cp = Ship.new("Submarine").submarines(@@cprand)
    @destroyer_cp = Ship.new("Destroyer").destroyers(@@cprand)
  end
end
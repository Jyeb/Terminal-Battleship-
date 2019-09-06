require_relative 'ships'
# Players class, initializing ship objects, inherited from the ship class.
class Players < Ship
  def player_one 
    @carrier = Ship.new.carriers(@@rand)
    @battleship = Ship.new.battleships(@@rand)
    @cruiser = Ship.new.cruisers(@@rand)
    @submarine = Ship.new.submarines(@@rand)
    @destroyer = Ship.new.destroyers(@@rand)
  end

  def computer_player
    @carrier_cp = Ship.new.carriers(@@cprand)
    @battleship_cp = Ship.new.battleships(@@cprand)
    @cruiser_cp = Ship.new.cruisers(@@cprand)
    @submarine_cp = Ship.new.submarines(@@cprand)
    @destroyer_cp = Ship.new.destroyers(@@cprand)
  end
end
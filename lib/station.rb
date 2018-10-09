require "oyster.rb"

class Station
  attr_reader :zone
  attr_reader :name
  def initialize(name = "Picadilly", zone = 1)
    @min_fare = 5
    @name = name
    @zone = zone
  end

  def touch_in(card)
    raise('Insufficient funds.') unless card.check_balance >= @min_fare
    card.add_journey(Journey.new(self))
    true
  end

  def touch_out(card)
    raise("ERROR! no journey found") if (card.get_last_journey == nil)
    card.journey_list[-1].end_the_journey(self)
    raise("ERROR! no touch in") if (card.get_last_journey).complete? == false
    card.deduct(card.journey_list[-1].calc_fare)
    true
  end

  def show_zone
    return @zone
  end

end

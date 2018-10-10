require "calculatefare.rb"
class Oyster

attr_reader :journey_list

  def initialize(upper_limit = 20)
    @balance = 0
    @upper_limit = upper_limit
    @journey_list = []
    @calculatefare = CalculateFare.new
  end

  def check_balance
    @balance
  end

  def touch_in(station)
    raise('Insufficient funds') unless @balance >= @calculatefare.return_minimum
    add_journey(Journey.new(station))
    true
  end

  def touch_out(station)
    raise("ERROR! no journey found") if get_last_journey == nil
    @journey_list[-1].end_the_journey(station)
    raise("ERROR! no touch in") if get_last_journey.complete? == false
    deduct(journey_list[-1].calc_fare)
    true
  end

  def add_credit(amount)
    raise('Balance limited exceeded') unless (amount + @balance) <= @upper_limit
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def show_all_journeys
    @journey_list
  end

  def get_last_journey
    @journey_list.last
  end

  def add_journey(journey)
    @journey_list << journey
  end

  def deduct_penalty
    incomplete_journeys = 0
    @journey_list.each  do |journey|
      incomplete_journeys +=1 if journey.complete? == false
    end
    @calculatefare.calculate_penalty(incomplete_journeys)
  end

end

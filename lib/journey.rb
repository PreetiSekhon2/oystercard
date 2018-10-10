require "station.rb"
require "calculatefare.rb"

class Journey

  def initialize(start)
    @start_journey = start
    @end_journey = nil
    @paid = false
    @fare = 0
  end

  def show_start
    return @start_journey.name
  end

  def show_end
    return @end_journey.name
  end

  def end_the_journey(destination)
    @end_journey = destination
  end

  def complete?
    ((@start_journey == nil) || (@end_journey == nil)) ?  false : true
  end

  def calc_fare
    @fare = (CalculateFare.new.calculate_fare(@start_journey, @end_journey))
  end

end

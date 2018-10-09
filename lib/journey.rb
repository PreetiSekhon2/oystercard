require "station.rb"

class Journey

  def initialize(*start)
    @start_journey = start[0]
    @end_journey = nil
    @paid = false
    @fare = 0
  end

  def show_start
    return @start_journey
  end

  def show_end
    return @end_journey
  end

  def end_the_journey(destination)
    @end_journey = destination
  end

  def complete?
    ((@start_journey == nil) || (@end_journey == nil)) ?  false : true
  end

  def calc_fare
    return 0 if @start_journey.name == @end_journey.name
    @fare = (CalculateFare.new.calculate_fare(@start_journey.zone, @end_journey.zone))
  end

end

class CalculateFare
  def calculate_fare(zone1, zone2)
    case (zone1 - zone2).abs
      when 0 then fare = 1
      when 1 then fare = 2
      when 2 then fare = 3
      when 3 then fare = 4
      else @fare = 5
    end
  end
end

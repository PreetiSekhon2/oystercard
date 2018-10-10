require 'station'

class CalculateFare

  def initialize(minfare = 6)
    @MIN_FARE = minfare
  end

  def return_minimum
    @MIN_FARE
  end

  def calculate_fare(start_journey, end_journey)
    return 0 if start_journey.name == end_journey.name
    case (start_journey.zone - end_journey.zone).abs
      when 0 then fare = 6
      when 1 then fare = 7
      when 2 then fare = 8
      when 3 then fare = 9
      else @fare = 10
    end
  end

end

require 'station'

class CalculateFare

  MIN_FARE = 6
  PENALTY_FARE = 50

  def return_minimum
    MIN_FARE
  end

  def return_penalty
    PENALTY_FARE
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

  def calculate_penalty(incomplete_journeys)
    incomplete_journeys * PENALTY_FARE
  end

end

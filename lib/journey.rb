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

  def end_journey(destination)
    @end_journey = destination
  end

  def complete?
    ((@start_journey == nil) || (@end_journey == nil)) ?  false : true
  end

  def calculate_fare
    @fare = 1
=begin
    case ((@start_journey.show_zone - @end_journey.show_zone).abs)
      when 0 then fare = 1
      when 1 then fare = 2
      when 2 then fare = 3
      when 3 then fare = 4
      else @fare = 5
    end
=end
  end

end

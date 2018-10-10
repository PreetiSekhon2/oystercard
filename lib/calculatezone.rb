class CalculateZone

  def initialize
    @zonemap = {
      1 => ["Clapham","Embankment"],
      2 => ["Tower Hill","Temple"],
      3 => ["Camden","Picadilly","Richmond"],
      4 => ["London Bridge", "Shoreditch"]
    }
  end

  def calculate_zone(name)
    @zonemap.each { |zone,station|
      return zone if station.include?(name)
    }
    return 5
  end
end

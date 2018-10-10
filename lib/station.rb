require "oyster.rb"
require "calculatezone.rb"

class Station

  attr_reader :zone, :name

  def initialize(name = "Picadilly")
    @name = name
    @zone = CalculateZone.new.calculate_zone(@name)
  end

end

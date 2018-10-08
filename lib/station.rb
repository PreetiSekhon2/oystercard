class Station
  def initialize
    @min_fare = 5
  end

  def touch_in(card)
    raise('Insufficient funds.') unless card.check_balance >= @min_fare
    true
  end

  def touch_out(card)
    card.deduct(@min_fare)
    true
  end
end

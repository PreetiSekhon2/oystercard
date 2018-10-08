class Oyster
attr_reader :journey_list

  def initialize(upper_limit = 20)
    @balance = 0
    @upper_limit = upper_limit
    @journey_list = []
  end

  def check_balance
    @balance
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

  def calculate_penalty
    incomplete_journeys = 0
    @journey_list.each  do |journey|
      incomplete_journeys +=1 if journey.complete? == false
    end
    deduct(incomplete_journeys * 100)
    incomplete_journeys * 100
  end

end

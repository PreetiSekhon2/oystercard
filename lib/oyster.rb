class Oyster

  def initialize(upper_limit = 20)
    @balance = 0
    @upper_limit = upper_limit
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
end

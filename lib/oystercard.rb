class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 0

  attr_reader :balance

  def initialize(balance=0)
    @balance = balance
  end

  def top_up(amount)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Insufficient funds for this journey. Please top up your oystercard" if @balance - amount < MIN_BALANCE
    @balance -= amount
  end

end

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 0

  attr_reader :balance, :journey_status

  def initialize(balance=0, journey_status=false)
    @balance = balance
    @journey_status = journey_status
  end

  def top_up(amount)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Insufficient funds for this journey. Please top up your oystercard" if @balance - amount < MIN_BALANCE
    @balance -= amount
  end

  def in_journey?
    @journey_status
  end

end

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 0
  MIN_FARE = 1

  attr_reader :balance, :journey_in_progress

  def initialize(balance=0, journey_in_progress=false)
    @balance = balance
    @journey_in_progress = journey_in_progress
  end

  def top_up(amount)
    fail "Maximum balance of #{MAX_BALANCE} exceeded" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    fail "Insufficient funds. Please top up your oystercard" if @balance - amount < MIN_BALANCE
    @balance -= amount
  end

  def in_journey?
    @journey_in_progress
  end

  def touch_in
    fail "Insufficient funds to touch in. Please top up your oystercard" if @balance < MIN_FARE
    @journey_in_progress = true
  end

  def touch_out
    @journey_in_progress = false
  end

end

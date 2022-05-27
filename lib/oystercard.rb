class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 0
  MIN_FARE = 1

  attr_reader :balance, :in_journey

  def initialize(balance=0, in_journey=false)
    @balance = balance
    @in_journey = in_journey
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
    @in_journey
  end

  def touch_in
    fail "Insufficient funds to touch in. Please top up your oystercard" if @balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end

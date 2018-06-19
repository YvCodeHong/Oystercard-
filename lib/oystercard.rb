class Oystercard

attr_reader :balance ,:status, :station
MAXIMUM_BALANCE = 90
MINIMUM_TRAVEL_BALANCE = 1

def initialize
  @balance = 0
  @status = "inactive"
end

def top_up(money)
   fail "Cannot exceed £90" if money + balance > MAXIMUM_BALANCE
    @balance += money
    return @balance
  end

  def deduct(amount)
  @balance -= amount
  end

  def in_journey?
    status == "active"
end

  def touch_in(station)
    fail "Not enough funds to travel" if low_balance?
    @status = "active"
  end

  def touch_out
    @status = "inactive"

  end

  def low_balance?
    @balance < MINIMUM_TRAVEL_BALANCE
  end

end 

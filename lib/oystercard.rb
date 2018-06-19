class Oystercard

attr_reader :balance ,:status
MAXIMUM_BALANCE = 90

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

  def touch_in
  @status = "active"
  end

  def touch_out
    @status = "inactive"
  end
end

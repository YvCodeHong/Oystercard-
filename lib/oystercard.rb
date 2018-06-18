class Oystercard

attr_reader :balance
MAXIMUM_BALANCE = 90

def initialize
  @balance = 0
end

def top_up(money)
   fail "Cannot exceed £90" if money + balance > MAXIMUM_BALANCE
    @balance += money
    return @balance
  end
end

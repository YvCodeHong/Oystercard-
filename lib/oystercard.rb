class Oystercard

attr_reader :balance ,:status, :entry_station, :exit_station, :list_journeys
MAXIMUM_BALANCE = 90
MINIMUM_CHARGE = 1

def initialize
  @balance = 0
  @status = "inactive"
  @list_journeys =[]
end

def top_up(money)
   fail "Cannot exceed £90" if money + balance > MAXIMUM_BALANCE
    @balance += money
    return @balance
  end

def in_journey?
    status == "active"
end

  def touch_in(entry_station)
    @entry_station = entry_station
    fail "Not enough funds to travel" if low_balance?
    @status = "active"
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @exit_station = exit_station
    add_journey
    @entry_station = nil
    @status = "inactive"
  end

  def low_balance?
    @balance < MINIMUM_CHARGE
  end

  def add_journey
    @list_journeys << { :entry_s => @entry_station, :exit_s => @exit_station }
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

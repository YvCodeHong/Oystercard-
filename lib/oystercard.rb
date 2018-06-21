require_relative '../lib/station.rb'
require_relative '../lib/journey.rb'

class Oystercard

attr_reader :balance ,:status, :entry_station, :exit_station, :list_journeys, :journey
MAXIMUM_BALANCE = 90
MINIMUM_CHARGE = 1

def initialize
  @balance = 0
  @list_journeys =[]
  @journey = nil
end

def top_up(money)
   fail "Cannot exceed £90" if money + balance > MAXIMUM_BALANCE
    @balance += money
    return @balance
  end

def in_journey?
     @journey != nil
end

  def touch_in(entry_station)
    @journey = Journey.new
    @journey.entry_station = entry_station
    fail "Not enough funds to travel" if low_balance?
  end

  def touch_out(exit_station)
    deduct(fare)
    @journey.exit_station = exit_station
    add_journey
    @journey = nil
  end

  def fare
    MINIMUM_CHARGE
  end

  def low_balance?
    @balance < MINIMUM_CHARGE
  end

  def add_journey
    @list_journeys << { :entry_s => @journey.entry_station, :exit_s => @journey.exit_station }
  end

private

  def deduct(amount)
    @balance -= amount
  end
end

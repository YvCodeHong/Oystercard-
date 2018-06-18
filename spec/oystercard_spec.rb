require 'oystercard'

describe Oystercard do

it 'should have a balance' do
  oystercard = Oystercard.new
  expect(subject.balance).to eq 0
end

describe '#top_up' do
 it 'can be topped up' do
   oystercard = Oystercard.new
   subject.top_up(10)
   expect(subject.balance).to eq 10
   #expect subject=oystercard's balance to equal to 10
 end
end

 describe "maximum_balance" do
   it 'cannot exceed (90)' do
   maximum_balance = Oystercard::MAXIMUM_BALANCE
   subject.top_up(maximum_balance)
   expect {subject.top_up(1)}.to raise_error "Cannot exceed £90"
  end
  end
end

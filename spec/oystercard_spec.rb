require 'oystercard'

describe Oystercard do
  let(:oystercard) { Oystercard.new }

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

  describe 'in_journey' do
    it'is initially not in a journey' do
      expect(subject).not_to be_in_journey
    end
  end

  describe "touch_in" do
     it "should record the entry station" do
        subject.top_up(10)
        subject.touch_in("entry_station")
        expect(subject.journey.entry_station).to eq "entry_station"
      end


     it "should not allow you to travel as balance is lower than minimum" do
        low_top_up = (Oystercard::MINIMUM_CHARGE) -1
        oystercard.top_up(low_top_up)
        expect(oystercard).to be_low_balance
    end
  end

  describe "touch_out" do
    let(:entry_station) { double :station }
    let(:exit_station) {double :station }

    it 'should record the exit station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.list_journeys[0][:exit_s]).to eq exit_station
    end

    it 'should forget the entry station, set nil' do
     subject.top_up(10)
     subject.touch_in(entry_station)
     subject.touch_out(exit_station)
     expect(subject.entry_station).to eq nil
   end


    it 'should deduct minimum amount from balance' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.balance).to eq 9

    end

    it "changes card to inactive" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.in_journey?).to eq false
    end
   end

   describe "list of journeys" do
     let(:entry_station) { double :station }
     let(:exit_station) {double :station }
     it 'should have an empty list of journeys by default' do
     expect(subject.list_journeys).to be_empty
    end

    it 'should store a journey' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.list_journeys.size).to eq 1
    end
 end
end

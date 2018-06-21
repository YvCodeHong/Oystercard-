require 'journey'
require 'oystercard.rb'

describe Journey do
 let(:station) { double :station, zone:1 }
 let(:oyster)  { Oystercard.new }

 it 'should know if the journey is not complete' do
   oyster.top_up(10)
   oyster.touch_in(station)
   expect(oyster.in_journey?).to eq true
end
end

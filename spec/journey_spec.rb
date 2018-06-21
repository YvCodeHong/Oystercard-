require 'journey'

describe Journey do
 let(:station) { double :station, zone:1 }

 it 'should know if the journey is not complete' do
   expect (subject).not_to be_complete
 end





end

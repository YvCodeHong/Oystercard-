require 'station'
#can we refactor the describe station- into one 'expect' sentence?
describe Station do

let(:station) { Station.new(station_name: "Aldgate", zone:1)}

it 'should know what nane of the station is' do
  expect(station.station_name).to eq("Aldgate")
end

it 'should know what zone of the station is' do
  expect(station.station_zone).to eq(1)
endf

end

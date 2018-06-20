require 'station'
#can we refactor the describe station- into one 'expect' sentence? 
describe Station do
  it 'should create an empty name' do
    expect(subject.name).to eq nil
  end

  it 'should create an empty zone' do
    expect(subject.zone).to eq nil
  end
end

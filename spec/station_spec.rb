require 'station.rb'

describe Station do

  subject = Station.new("Clapham")

  it "Returns a name" do
    expect(subject.name).to eq("Clapham")
  end

  it "Returns a zone" do
    expect(subject.zone).to eq 1
  end

end

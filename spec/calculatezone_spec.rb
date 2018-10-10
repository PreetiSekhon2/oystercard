require "calculatezone.rb"

describe CalculateZone do

  it "shows the correct zone for a station" do
    expect(subject.calculate_zone("Clapham")).to eq 1
  end

  it "defaults the zone for an unknown station to 5" do
    expect(subject.calculate_zone("HAHA")).to eq 5
  end

end

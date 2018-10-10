require "calculatefare.rb"

describe CalculateFare do

  let (:station1) {double :station, :zone => 1,:name => "Camden"}
  let (:station2) {double :station, :zone => 3, :name => "Clapham"}

  it "shows the minimum fare" do
    expect(subject.return_minimum).to eq 6
  end

  it "shows the penalty fare" do
    expect(subject.return_penalty).to eq 50
  end

  it "calculates penalty correctly for 3 incomplete journeys" do
    expect(subject.calculate_penalty(3)).to eq 150
  end

  it "calculates the fare correctly for a journey accross 2 zones" do
    expect(subject.calculate_fare(station1,station2)).to eq 8
  end

end

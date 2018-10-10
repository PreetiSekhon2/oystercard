require "journey"

describe Journey do

  let(:station)  {double :station, :name => "Camden", :zone => 1}
  let(:station1)  {double :station, :name => "Barbican", :zone => 1}
  let(:station2)  {double :station2, :name => "Clapham", :zone => 3}
  subject(:journey) { Journey.new(station) }

  context "1. Journey completion checks" do

    it "shows a customer where the journey started" do
      expect(journey.show_start).to eq("Camden")
    end

    it "shows a journey is complete when it has both start and destination" do
      journey.end_the_journey(station)
      expect(journey.complete?).to eq(true)
    end

    it "shows a journey is INCOMPLETE when destination is missing" do
      expect(journey.complete?).to eq(false)
    end

  end

  context "2. Fare calculation checks" do

    it "Calculates the correct fare when journey is accross two zones" do
      journey.end_the_journey(station2)
      expect(journey.calc_fare).to eq(8)
    end

    it "Calculates the correct fare when journey is accross same zone" do
      journey.end_the_journey(station1)
      expect(journey.calc_fare).to eq(6)
    end

    it "Calculates the fare to be ZERO when journey start and end is the same station" do
      subject.end_the_journey(station)
      expect(subject.calc_fare).to eq(0)
    end

  end
end

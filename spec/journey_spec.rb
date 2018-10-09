require "journey"
require "station"

describe Journey do

  context "1. Journey completion tests" do

    it "shows a customer where the journey started" do
      subject = Journey.new("Camden")
      expect(subject.show_start).to eq("Camden")
    end

    it "shows a journey is complete when it has both start and destination" do
      subject = Journey.new("Camden",1)
      subject.end_the_journey(Station.new("Clapham",3))
      expect(subject.complete?).to eq(true)
    end

    it "shows a journey is INCOMPLETE when start is missing" do
      subject = Journey.new("Camden",2)
      #subject.end_journey("Clapham")
      expect(subject.complete?).to eq(false)
    end

    it "shows a journey is INCOMPLETE when destination is missing" do
      subject.end_the_journey(Station.new("Clapham",4))
      expect(subject.complete?).to eq(false)
    end
  end

  context "2. Fare calculation checks" do

    it "Calculates the correct fare when journey is accross two zones" do
      subject = Journey.new(Station.new("Camden",3))
      subject.end_the_journey(Station.new("Clapham",5))
      expect(subject.calc_fare).to eq(3)
    end

    it "Calculates the correct fare when journey is accross same zone" do
      subject = Journey.new(Station.new("Camden",3))
      subject.end_the_journey(Station.new("Clapham",3))
      expect(subject.calc_fare).to eq(1)
    end

    it "Calculates the  fare to be ZERO when journey start and end is the same station" do
      subject = Journey.new(Station.new("Camden",3))
      subject.end_the_journey(Station.new("Camden",3))
      expect(subject.calc_fare).to eq(0)
    end

  end
end

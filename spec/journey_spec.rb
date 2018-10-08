require "journey"

describe Journey do

  it "shows a customer where the journey started" do
    subject = Journey.new("Camden")
    expect(subject.show_start).to eq("Camden")
  end

  it "shows a journey is complete when it has both start and destination" do
    subject = Journey.new("Camden")
    subject.end_journey("Clapham")
    expect(subject.complete?).to eq(true)
  end

  it "shows a journey is INCOMPLETE when start is missing" do
    subject = Journey.new("Camden")
    #subject.end_journey("Clapham")
    expect(subject.complete?).to eq(false)
  end

  it "shows a journey is INCOMPLETE when destination is missing" do
    subject.end_journey("Clapham")
    expect(subject.complete?).to eq(false)
  end

end

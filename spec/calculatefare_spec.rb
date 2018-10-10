require "calculatefare.rb"

describe CalculateFare do
  it "shows the minimum fare" do
    expect(subject.return_minimum).to eq 6
  end

  it "shows the penalty fare" do
    expect(subject.PENALTY_FARE).to eq 50
  end
end

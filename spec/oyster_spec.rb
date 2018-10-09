require 'oyster.rb'
require 'journey.rb'

describe Oyster do
    let(:station){ double :station, :touch_in => true, :touch_out => true }
    let(:journey) {double :journey}

  context '1. Checking Balances' do
    it 'return balance when customer calls check_balance method' do
      expect(subject.check_balance).to eq 0
    end

    it 'add_credit increments balance on the card by amount specified by the customer' do
      subject.add_credit(5)
      expect(subject.check_balance).to eq 5
    end

    it 'prevents balance from exceeding upper limit of £20' do
      expect{ subject.add_credit(30) }.to raise_error('Balance limited exceeded')
    end

    it 'allows deduction of fare/penalty from the balance on the card' do
      expect(subject.deduct(5)).to eq(-5)
    end

    #test does not work as expected due to stubbing and output is dependent on the interaction of two classes
    it 'deducts fare when  completing a journey' do
      subject.add_credit(10)
      subject.deduct(5)
      expect(subject.check_balance).to eq(5)
    end
  end

  context "2. Tracking Journeys" do
    it "shows all the journeys taken on this oyster card when user calls show all" do
      subject.add_journey(Journey.new("London Bridge"))
      subject.add_journey(Journey.new("Tower Hill"))
      subject.add_journey(Journey.new("Clapham"))
      expect(subject.journey_list.size).to eq 3
      puts subject.journey_list
    end

    it "adds another journey to the journey log on the card" do
      sum = subject.journey_list.size
      subject.add_journey(journey)
      expect(subject.journey_list.size).to be > sum
    end
  end

  context "3. Penalty calculation" do
    it "Calculates the penalty on all the incomplete journeys on the card and displays it; each incomplete journey = 100GBP" do
      subject.add_journey(Journey.new("London Bridge"))
      subject.add_journey(Journey.new("Tower Hill"))
      subject.add_journey(Journey.new("Clapham"))
      expect(subject.calculate_penalty).to eq 300
    end

    it "Deducts the penalty on all the incomplete journeys from the balance on the card" do
      subject.add_journey(Journey.new("London Bridge"))
      subject.add_journey(Journey.new("Tower Hill"))
      subject.add_journey(Journey.new("Clapham"))
      subject.calculate_penalty
      expect(subject.check_balance).to eq -300
    end

  end

end

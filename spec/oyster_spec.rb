require 'oyster.rb'

describe Oyster do
    let(:station) {double :station, :name => "Clapham", :zone => 1 }
    let(:station2) {double :station, :name => "Camden", :zone => 3}
    let(:journey1) {double :journey, :complete? => false}
    let(:journey2) {double :journey, :complete? => false}
    let(:journey3) {double :journey, :complete? => false}
    subject(:oyster) { Oyster.new }

  context '1. Checking Balances' do
    it 'return balance when customer calls check_balance method' do
      expect(oyster.check_balance).to eq 0
    end

    it 'add_credit increments balance on the card by amount specified by the customer' do
      oyster.add_credit(5)
      expect(oyster.check_balance).to eq 5
    end

    it 'prevents balance from exceeding upper limit of £20' do
      expect{ oyster.add_credit(30) }.to raise_error('Balance limited exceeded')
    end

    it 'allows deduction of fare/penalty from the balance on the card' do
      expect(oyster.deduct(5)).to eq(-5)
    end

    it 'deducts fare when  completing a journey' do
      oyster.add_credit(10)
      oyster.deduct(5)
      expect(oyster.check_balance).to eq(5)
    end


#REQUIRE
    it 'allows customer to touch out and show the amount deducted for the journey' do
      oyster.add_credit(20)
      oyster.touch_in(station)
      oyster.touch_out(station2)
      expect(oyster.check_balance).to eq(12)
    end

    it 'should not allow to touch in if balance on card is below min fare (5)' do
      expect{ oyster.touch_in(station) }.to raise_error('Insufficient funds')
    end
  end

  context "2. Tracking Journeys" do
    it "shows all the journeys taken on this oyster card when user calls show all" do
      oyster.add_journey(journey1)
      oyster.add_journey(journey2)
      oyster.add_journey(journey3)
      expect(oyster.journey_list.size).to eq 3
    end

    it "adds another journey to the journey log on the card" do
      sum = oyster.journey_list.size
      oyster.add_journey(journey1)
      expect(oyster.journey_list.size).to be > sum
    end

#REQUIRE
    it 'Allows customer to touch in' do
      oyster.add_credit(20)
      expect(oyster.touch_in(station)).to eq(true)
    end

#REQUIRE
    it 'Allows customer to touch out' do
      oyster.add_credit(20)
      oyster.touch_in(station)
      expect(oyster.touch_out(station2)).to eq(true)
    end

    it 'Does NOT allow customer to touch out if there was no proper touch in' do
      oyster.add_credit(20)
      expect{oyster.touch_out(station)}.to raise_error("ERROR! no journey found")
    end

  end

  context "3. Penalty calculation" do
    it "Calculates the penalty on all the incomplete journeys on the card and displays it; each incomplete journey = 100GBP" do
      oyster.add_journey(journey1)
      oyster.add_journey(journey2)
      oyster.add_journey(journey3)
      expect(oyster.deduct_penalty).to eq 150
    end

    it "Deducts the penalty on all the incomplete journeys from the balance on the card" do
      oyster.add_journey(journey1)
      oyster.add_journey(journey2)
      oyster.add_journey(journey3)
      oyster.deduct(oyster.deduct_penalty)
      expect(oyster.check_balance).to eq -150
    end

  end

end

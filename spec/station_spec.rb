require 'station.rb'
require "oyster.rb"

describe Station do

  before(:each) do
    subject = Station.new("Clapham",2)
  end

  let(:card_high_balance) { double :card, :check_balance => 20, :deduct => true, :add_journey =>true }
  let(:card_low_balance) { double :card, :check_balance => 4 }

  it 'Allows customer to touch in' do
    expect(subject.touch_in(card_high_balance)).to eq(true)
  end

  it 'Allows customer to touch out' do
    card2 = Oyster.new
    card2.add_credit(20)
    subject.touch_in(card2)
    expect(subject.touch_out(card2)).to eq(true)
  end

  it 'Does NOT allow customer to touch out if there was no proper touch in' do
    card2 = Oyster.new
    card2.add_credit(20)
    expect{subject.touch_out(card2)}.to raise_error("ERROR! no journey found")
  end

  it 'Allows customer to touch out and show the amount deducted for the journey' do
    card2 = Oyster.new
    card2.add_credit(20)
    subject.touch_in(card2)
    subject.touch_out(card2)
    expect(card2.check_balance).to eq(19)
  end

  it 'should not allow to touch in if balance on card is below min fare (5)' do
    expect{ subject.touch_in(card_low_balance) }.to raise_error('Insufficient funds.')
  end

  it 'should show passenger the zone of the station' do
    subject = Station.new("Temple" , 1)
    expect(subject.show_zone).to eq 1
  end

end

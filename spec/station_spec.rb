require 'station.rb'

describe Station do
  let(:card_high_balance) { double :card, :check_balance => 20, :deduct => true }
  let(:card_low_balance) { double :card, :check_balance => 4 }

  it 'Allows customer to touch in' do
    expect(subject.touch_in(card_high_balance)).to eq(true)
  end

  it 'Allows customer to touch out' do
    expect(subject.touch_out(card_high_balance)).to eq(true)
  end

  it 'should not allow to touch in if balance on card is below min fare (5)' do
    expect{ subject.touch_in(card_low_balance) }.to raise_error('Insufficient funds.')
  end


end

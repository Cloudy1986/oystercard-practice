require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'initializes an oystercard object with a balance attribute of zero and a journey status of false' do
      expect(subject).to be_a Oystercard
      expect(subject.balance).to eq 0
      expect(subject.in_journey).to eq false
    end
  end

  describe "#top_up" do
    it 'increases the balance attribute of an oystercard by the value of the argument passed to it' do
      expect{ subject.top_up(50) }.to change { subject.balance }.by 50
    end

    it 'raises an error if the balance would exceed the maximum balance of 90' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{max_balance} exceeded"
    end
  end

  describe "#deduct" do
    it 'decreases the balance attribute of an oystercard by the value of the argument passed to it' do
      subject.top_up(50)
      expect { subject.deduct(5)}.to change { subject.balance }.by -5
    end

    it 'raises an error if the balance would fall below the minimum balance of 0' do
      min_balance = Oystercard::MIN_BALANCE
      expect{ subject.deduct(50) }.to raise_error "Insufficient funds. Please top up your oystercard"
    end
  end

  describe '#in_journey' do
    it 'returns false when the oystercard has not been touched in' do
      expect(subject).to_not be_in_journey
    end
    
    it 'returns true when the oystercard has been touched in' do
      subject.top_up(50)
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'returns false when the oystercard has been touched in and touched out' do
      subject.top_up(50)
      subject.touch_in
      subject.touch_out
      expect(subject).to_not be_in_journey
    end
  end

  describe '#touch_in' do
    it 'raises an error if the oystercard has insufficient funds for the minimum fare' do
      expect { subject.touch_in }.to raise_error "Insufficient funds to touch in. Please top up your oystercard"
    end

    it 'does not raise an error if the oystercard has funds greater than the minimum fare' do
      subject.top_up(50)
      expect { subject.touch_in }.not_to raise_error
    end
  end

end
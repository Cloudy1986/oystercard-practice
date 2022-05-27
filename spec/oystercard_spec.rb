require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'initializes an oystercard object with a balance attribute of zero' do
      expect(subject).to be_a Oystercard
      expect(subject.balance).to eq 0
    end
  end

  describe "top_up" do
    it 'increases the balance attribute of an oystercard by the value of the argument passed to it' do
      expect{ subject.top_up(50) }.to change { subject.balance }.by 50
    end

    it 'raises an error if the balance would exceed the maximum balance of 90' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect{ subject.top_up(1) }.to raise_error "Maximum balance of #{max_balance} exceeded"
    end
  end

end
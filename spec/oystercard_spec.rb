require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'creates a oystercard object with a balance attribute of zero' do
      expect(subject).to be_a Oystercard
      expect(subject.balance).to eq 0
    end
  end

  describe "top_up" do
    it 'adds the value of the argument to the balance' do
      oystercard = subject
      oystercard.top_up(50)     
      expect(oystercard.balance).to eq 50
    end
  end

end
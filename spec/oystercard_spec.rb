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
  end

end
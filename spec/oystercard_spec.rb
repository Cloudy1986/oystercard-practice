require 'oystercard'

describe Oystercard do

  describe '#initialize' do
    it 'creates a oystercard object with a balance attribute of zero' do
      expect(subject).to be_a Oystercard
      expect(subject.balance).to eq 0
    end
  end

end
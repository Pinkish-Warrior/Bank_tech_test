require 'transactions'

describe Transactions do
  subject(:transaction) { Transactions.new }

  context '#Statment' do
    it 'can gather any indidual transaction made' do
      expect(subject.statment).to eq([])
    end
  end

  context '#Transaction List' do
    it 'can provide a full statment of any transaction made' do
      subject.transaction_list('', 3, 0, 3)
      subject.transaction_list('', 5, 2, 6)
      expect(subject.statment).to eq([['', 3, 0, 3], ['', 5, 2, 6]])
    end
  end
end

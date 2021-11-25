require 'bank_account'
require 'spec_helper'

describe BankAccount do
  subject(:bank_account) { BankAccount.new(transaction) }
  let(:transaction) { double(:transaction_list, transaction_list: nil) }
  before(:each) do
    @time = Time.new
  end

  context '#BankAccount' do
    it 'can create a instance of #bank_account' do
      expect(bank_account).to be_kind_of(BankAccount)
    end
  end

  context '#Balance' do
    it 'should show the #balance of the account' do
      expect(bank_account.balance).to eq(0)
    end
  end

  context '#Deposit' do
    it 'should be able to make a #deposit of sums and update balance' do
      actual_date = @time.strftime('%F').split('-').reverse.join('/')
      expect(transaction).to receive(:transaction_list).with(actual_date, 5, 0, 5)
      bank_account.deposit(5)
      expect(bank_account.balance).to eq(5)
    end
  end

  context '#Withdraw' do
    it 'should be able to #withdraw sums and update balance' do
      actual_date = @time.strftime('%F').split('-').reverse.join('/')
      bank_account.deposit(20)
      expect(transaction).to receive(:transaction_list).with(actual_date, 0, 10, 10)
      bank_account.withdraw(10)
      
      expect(bank_account.balance).to eq(10)
    end

    it 'shall not allow any #withdraw beyond balance' do
      bank_account.deposit(8)
      expect { bank_account.withdraw(16) }.to raise_error 'No sufficient funds'
    end
  end
end

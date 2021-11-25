require_relative 'transactions'
require_relative 'display'

require 'time'
require 'date'

class BankAccount
  attr_reader :balance

  # attr_reader :account_number
  
  # needed to create instance variables as the methods have to talking to each other
  def initialize(transaction = Transactions.new, actual_date = Time.new)
    @balance = 0
    @account_number = create_account_number
    @transaction = transaction
    @date = actual_date
  end

  def deposit(money)
    @balance += money
    @transaction.transaction_list("#{@date.strftime('%F').split('-').reverse.join('/')}", money, 0, @balance)
  end

  def withdraw(money)
    if @balance < money
      raise 'No sufficient funds'
    else
      @balance -= money
      @transaction.transaction_list("#{@date.strftime('%F').split('-').reverse.join('/')}", 0, money, @balance)
    end
  end

  private
  
  def create_account_number
    rand(13**13)
  end
end

# p "up running yey yo"

# bank_account = BankAccount.new
# bank_account.deposit(10)
# bank_account.withdraw(2).
# bank_account.withdraw(2)
# bank_account.withdraw(2)
# bank_account.balance.transaction_time


# needed to create instance variables as the methods have to talking to each other

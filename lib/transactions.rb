require_relative 'bank_account'
require_relative 'display'

require 'time'
require 'date'

class Transactions

  attr_reader :statment

  def initialize
    @statment = []
  end

  def transaction_list(actual_date, deposit, withdraw, balance)
    @statment << [actual_date, deposit, withdraw, balance]
  end
end

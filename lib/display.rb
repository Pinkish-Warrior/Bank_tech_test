require_relative 'bank_account'
require_relative 'transactions'

require 'time'
require 'date'

class Display

  def header
    "  date   ||  credit  ||  debit   ||  balance\n"
  end

  def screen_display(statment)
    string = ''
    statment.reverse.map { |row| string += " #{row[0]} || " + "#{row[1]} || " + "#{row[2]} || " + "#{row[3]}\n" }
    header + string
  end
end

display = Display.new
print display.header

require 'display'

describe Display do
  subject(:display) { Display.new }
  context '#Header' do
    it 'shows the #header of the statment' do
      expect(display.header).to eq "  date   ||  credit  ||  debit   ||  balance\n"
    end
  end
  
  context '#Screen Display' do
    it 'can make a #screen_display of all transaction made' do
      statment = [['12/01/2021', 10,  0, 10], ['13/01/2021', 0, 5, 5]]
      expect(display.screen_display(statment)).to eq "  date   ||  credit  ||  debit   ||  balance\n 13/01/2021 || 0 || 5 || 5\n 12/01/2021 || 10 || 0 || 10\n"
    end
  end
end

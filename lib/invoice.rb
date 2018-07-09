class Invoice
  attr_accessor :debtor, :number, :amount

  def initialize(debtor, number, amount)
    @debtor = debtor
    @number = number
    @amount = amount
  end
end
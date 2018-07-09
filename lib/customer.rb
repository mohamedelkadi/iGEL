class Customer
  attr_accessor :credit, :invoices

  def initialize(credit, invoices)
    @credit = credit
    @invoices = invoices
  end
end
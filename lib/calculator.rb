class Calculator
  attr_reader :credit

  def initialize(customer)
    @invoices = customer.invoices
    @credit = customer.credit
  end

  def results
    obj = {}
    @invoices.each do |inv|
      obj[inv.number] = invoice_amount(inv.amount)
    end

    obj
  end

  private

  def invoice_amount(amount)
    return 0 if @credit.zero?

    res = @credit > amount ? amount : @credit
    @credit -= res

    res
  end
end
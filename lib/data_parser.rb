require 'json'
require './lib/invoice'

class DataParser
  CREDIT_FILE = 'credit_line.json'.freeze
  INVOICES_FILE = 'invoices.json'.freeze

  def initialize(dir)
    @dir = dir
  end

  def load_row(file)
    full_path = File.join @dir, file
    File.read(full_path)
  end

  def load_and_parse
    return if @loaded

    @credit_txt = load_row CREDIT_FILE
    @invoices_txt = load_row INVOICES_FILE

    @invoices = JSON.parse(@invoices_txt)
    @credit = JSON.parse(@credit_txt)
    @loaded = true
  end

  def invoices
    load_and_parse

    @invoices.map do |inv|
      Invoice.new(inv['debtor'], inv['number'], inv['amount'])
    end
  end

  def credit
    load_and_parse

    @credit['customer']
  end
end
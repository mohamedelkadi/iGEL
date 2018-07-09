#!/usr/bin/env ruby

require './lib/data_parser'
require './lib/customer'
require './lib/calculator'

if ARGV.empty?
  puts 'Dir must be given'
  exit(1)
end

dir = ARGV.first
data = DataParser.new(dir)
customer = Customer.new data.credit, data.invoices
calc = Calculator.new(customer)

p "results: #{calc.results}"
p "credit: #{calc.credit}"
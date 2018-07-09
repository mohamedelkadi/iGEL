require 'rspec'
require 'ostruct'
require './lib/calculator'

describe Calculator do

  describe '#calculate' do

    let(:credit) { 40000 }
    let(:invoices) do
      [
        {
          'debtor' => 'fritz-kola',
          'number' => 'inv-kola1',
          'amount' => 16000
        },
        {
          'debtor' => "Tommi's Burger Joint",
          'number' => 'inv-burger1',
          'amount' => 15000
        },
        {
          'debtor' => 'fritz-kola',
          'number' => 'inv-kola2',
          'amount' => 14000
        },
        {
          'debtor' => 'Dolores',
          'number' => 'inv-burrito1',
          'amount' => 15000
        },
        {
          'debtor' => "Tommi's Burger Joint",
          'number' => 'inv-burger2',
          'amount' => 2000
        }
      ].map { |el| OpenStruct.new(el) }
    end
    let(:result) do
      {
        "inv-kola1" => 16000,
        "inv-burger1" => 15000,
        "inv-kola2" => 9000,
        "inv-burrito1" => 0,
        "inv-burger2" => 0
      }
    end

    it 'takes customer and get the correct results ' do
      customer = double('Customer', credit: credit, invoices: invoices)
      expect(Calculator.new(customer).results).to eq(result)
    end
  end
end
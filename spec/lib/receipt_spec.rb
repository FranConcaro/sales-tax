require "spec_helper"
require "receipt"
require "basket"

RSpec.describe Receipt do
  context "valid receipt" do
    let(:products_data) do
      [
        { quantity: 2.0, price: 12.49, name: "book" },
        { quantity: 1.0, price: 14.99, name: "music CD" },
        { quantity: 1.0, price: 0.85, name: "chocolate bar" }
      ]
    end
    let(:basket) { Basket.new }
    let(:expected_output) do
      "2 book: 24.98\n1 music CD: 16.49\n1 chocolate bar: 0.85\nSales Taxes: 1.50\nTotal: 42.32\n"
    end

    it "prints the receipt" do
      products_data.each { |product_data| basket.add(product_data) }
      receipt = described_class.new(basket)
      expect { receipt.print_receipt }.to output(expected_output).to_stdout
    end
  end
end

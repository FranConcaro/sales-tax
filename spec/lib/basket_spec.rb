require "spec_helper"
require "basket"

RSpec.describe Basket do
  context "when input data is valid" do
    let(:products_data) do
      [
        { quantity: 2.0, price: 12.49, name: "imported boxes of chocolates" },
        { quantity: 1.0, price: 14.99, name: "music CD" },
        { quantity: 1.0, price: 0.85, name: "chocolate bar" }
      ]
    end
    let(:basket) { described_class.new }

    it "returns a Basket with the correct amount of products" do
      products_data.each { |product_data| basket.add(product_data) }

      expect(basket.products.size).to eq(3)
    end

    it "returns a Basket with the correct type of products" do
      products_data.each { |product_data| basket.add(product_data) }
      basket.products.each do |product|
        expect(product).to be_a(Product)
      end
    end
  end
end

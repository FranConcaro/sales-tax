require "spec_helper"
require "product"

RSpec.describe Product do
  context "valid product data passed as input" do
    let(:product_data) { { quantity: 3.0, price: 11.25, name: "imported boxes of chocolates" } }
    let(:product) { Product.new(product_data) }

    it "creates a valid product" do
      expect(product).to be_a(Product)
    end
    it "parses the correct name" do
      expect(product.name).to eq("imported boxes of chocolates")
    end
    it "parses the correct price" do
      expect(product.price).to eq(11.25)
    end
    it "parses the correct quantity" do
      expect(product.quantity).to eq(3.0)
    end
  end
end

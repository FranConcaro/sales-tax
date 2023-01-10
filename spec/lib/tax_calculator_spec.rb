require "spec_helper"
require "tax_calculator"
require "product"

RSpec.describe TaxCalculator do
  context "valid taxes" do
    let(:tax_calculator) { described_class.new }
    let(:product_data) { { quantity: 3.0, price: 11.25, name: "imported boxes of chocolates" } }
    let(:product) { Product.new(product_data) }

    it "calculate tax amount per unit" do
      expect(tax_calculator.calculate_taxes(product).tax_amount).to eq(0.6)
    end

    it "calculate product total" do
      expect(tax_calculator.calculate_taxes(product).total).to eq(35.55)
    end

    it "is exempt?" do
      expect(tax_calculator.calculate_taxes(product).exempt?).to eq(true)
    end

    it "is imported?" do
      expect(tax_calculator.calculate_taxes(product).imported?).to eq(true)
    end
  end
end

require_relative "tax_calculator"
class Receipt
  def initialize(basket)
    @tax_calculator = TaxCalculator.new
    @taxed_products = scan(basket)
  end

  def print_receipt
    receipt = ""
    @taxed_products.each do |product|
      @product = product
      receipt += "#{product.quantity.to_i} #{product.name}: #{format("%.2f", product.total)}\n"
    end
    receipt += "Sales Taxes: #{sales_taxes}\n"
    receipt += "Total: #{total}"
    puts receipt

    receipt
  end

  private

  def scan(basket)
    taxed_products = []
    basket.products.each do |product|
      taxed_products << @tax_calculator.calculate_taxes(product)
    end
  end

  def sales_taxes
    sales_taxes = @taxed_products.map { |product| product.tax_amount * product.quantity }.sum
    format("%.2f", sales_taxes)
  end

  def total
    total = @taxed_products.map { |product| product.total }.sum
    format("%.2f", total)
  end
end

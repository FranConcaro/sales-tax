require_relative "sales_tax"
class Main
  def initialize
    SalesTax.new(ARGV[0]).generate_receipt
  end
end
Main.new

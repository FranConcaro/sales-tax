require_relative "basket"
require_relative "receipt"

class SalesTax
  def initialize(file)
    @basket = Basket.new(file).parse_input
  end

  def generate_receipt
    Receipt.new(@basket).print_receipt
  end
end

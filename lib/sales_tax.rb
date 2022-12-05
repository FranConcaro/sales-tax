require_relative "basket"
require_relative "receipt"
require_relative "file_parser"

class SalesTax
  def initialize(file)
    file_parser = FileParser.new(file)
    @products_data = file_parser.products_data
    @basket = Basket.new
  end

  def generate_receipt
    @products_data.each do |product_data|
      @basket.add(product_data)
    end
    Receipt.new(@basket).print_receipt
  end
end

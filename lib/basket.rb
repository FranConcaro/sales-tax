require_relative "product"
class Basket
  def initialize(file)
    @file_lines = File.readlines(file)
    @products = []
  end

  def parse_input
    @file_lines.each do |line|
      @products << Product.new(line)
    end

    @products
  end
end

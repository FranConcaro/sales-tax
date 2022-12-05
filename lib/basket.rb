require_relative "product"
class Basket
  attr_accessor :products

  def initialize
    @products = []
  end

  def add(product)
    @products << Product.new(product)
  end
end

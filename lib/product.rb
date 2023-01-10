class Product
  attr_accessor :price, :name, :quantity, :total, :tax_amount

  BOOKS = ["book"]
  FOOD = ["chocolate"]
  MEDICAL_PRODUCTS = ["pills"]
  EXEMPT_PRODUCTS = [BOOKS, FOOD, MEDICAL_PRODUCTS].flatten

  def initialize(product_data)
    @price = product_data[:price]
    @name = product_data[:name]
    @quantity = product_data[:quantity]
  end

  def exempt?
    EXEMPT_PRODUCTS.each do |product|
      return true if @name.include?(product)
    end

    false
  end

  def imported?
    @name.match?(/import/i)
  end
end

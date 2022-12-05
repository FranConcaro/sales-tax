require_relative "constants"
class Product
  attr_accessor :price, :name, :quantity, :exempt, :imported, :total, :tax_amount

  include Constants
  def initialize(line)
    line.strip!
    quantity_item_name, price = line.split(/at\s+/)
    @quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
    @price = price.to_f
    @name = quantity_item_name.gsub(/\d+/, "").strip
    @exempt = exempt?(name)
    @imported = name.match?(/import/i)
  end

  private

  def exempt?(name)
    Exempt_products.each do |product|
      return true if name.include?(product)
    end

    false
  end
end

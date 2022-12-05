class FileParser
  attr_accessor :products_data

  def initialize(file)
    @file_lines = File.readlines(file)
    parse
  end

  private

  def parse
    @products_data = []
    @file_lines.each do |line|
      line.strip!
      quantity_item_name, price = line.split(/at\s+/)
      quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
      price = price.to_f
      name = quantity_item_name.gsub(/\d+/, "").strip

      @products_data << { quantity: quantity, price: price, name: name }
    end
  end
end

class Product
  PRODUCT_LINE_FORMAT = /(\w+), (\d+), (\w+), (\d+)/

  attr_accessor :type, :quantity, :name, :price

  def self.new_with_product_line(product_line)
    match = PRODUCT_LINE_FORMAT.match(product_line)

    product = self.new

    product.type = match[1]
    product.quantity = match[2].to_i
    product.name = match[3]
    product.price = match[4].to_i

    product
  end

  def total_price
    9000
  end
end

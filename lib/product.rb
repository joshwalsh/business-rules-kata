class Product
  PRODUCT_INPUT_FORMAT = /(\w+): (\d+) x (\w+) = \$(\d+)/

  attr_reader :type, :quantity, :product, :price

  def parse_product_line(product_line)
    match = PRODUCT_INPUT_FORMAT.match(product_line)

    @type = match[1]
    @type = "product" if match[1] == "products"

    @quantity = match[2].to_i
    @product = match[3]
    @price = match[4].to_i
  end
end

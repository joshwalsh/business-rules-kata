class Processor
  attr_reader :products

  def initialize(order_file)
    @order_file = order_file
    @products = []
  end

  def fetch_products
    order_contents = File.read(@order_file)

    order_contents.split("\n").each do |product_line|
      @products << parse_product_line(product_line)
    end
  end

  def parse_product_line(product_line)
    match = /(\w+): (\d+) x (\w+) = \$(\d+)/.match(product_line)

    type = match[1]
    type = "product" if type == "products"

    quantity = match[2].to_i
    product = match[3]
    price = match[4].to_i

    formatted_product_line = "#{type}: #{quantity} x #{product} = $#{price}"

    {
      :original => formatted_product_line, 
      :type => type,
      :quantity => quantity,
      :product => product,
      :price => price
    }
  end

  def run
    fetch_products

    packing_list = PackingSlip.new
    packing_list.products = @products
    puts packing_list.render
  end
end

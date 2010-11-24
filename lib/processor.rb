class Processor
  attr_reader :products

  def initialize
    @products = []
  end

  def fetch_products(order_file)
    order_contents = File.read(order_file)

    order_contents.split("\n").each do |product_line|
      @products << parse_product_line(product_line)
    end
  end

  def parse_product_line(product_line)
    match = /(\d+) x (\w+): \$(\d+)/.match(product_line)

    { 
      :original => product_line, 
      :quantity => match[1].to_i, 
      :product => match[2], 
      :price => match[3].to_i 
    }
  end

  def run
    fetch_products(ORDER_FILE)

    packing_list = PackingSlip.new
    packing_list.products = @products
    puts packing_list.render
  end
end

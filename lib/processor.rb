class Processor
  attr_reader :products

  def initialize(order_file)
    @order_file = order_file
    @products = []
  end

  def fetch_products
    order_contents = File.read(@order_file)

    order_contents.split("\n").each do |product_line|
      @products << Product.new_with_product_line(product_line)
    end
    
    @products
  end

  def run
    fetch_products

    packing_list = PackingSlip.new
    packing_list.products = @products
    puts packing_list.render
  end
end

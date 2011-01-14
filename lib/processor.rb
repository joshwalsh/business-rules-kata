class Processor
  def initialize(order_file)
    @order_file = order_file
  end

  def fetch_order
    Order.new(@order_file)
  end

  def run
    order = fetch_order

    packing_list = PackingSlip.new
    packing_list.products = order.products
    puts packing_list.render
  end
end

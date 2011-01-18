class PackingSlip
  attr_accessor :order

  def self.new_with_order(order)
    packing_slip = self.new
    packing_slip.order = order
    packing_slip
  end

  def render_products
    output = ''
    @order.products.each do |product|
      output += ProductRenderer.render_product(product) + "\n"
    end
    output
  end

  def render_for(receiver)
    output = ''
    output += receiver.upcase + " PACKING SLIP\n"
    output += "====================\n"
    output += render_products
    output += "---------\n"
    output += "Total: $#{@order.total_price}\n"
    output
  end
end

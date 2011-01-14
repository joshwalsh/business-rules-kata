class PackingSlip
  attr_accessor :order

  def self.new_with_order(order)
    packing_slip = self.new
    packing_slip.order = order
    packing_slip
  end

  def calculate_total_cost
    @order.products.inject(0) do |total, product|
      total + product.total_price
    end
  end

  def render_products
    output = ''
    @order.products.each do |product|
      output += ProductRenderer.render_product(product) + "\n"
    end
    output
  end

  def render
    output = ''
    output = render_products
    output += "---------\n"
    output += "Total: $#{calculate_total_cost}\n"
    output
  end
end

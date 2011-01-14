class PackingSlip
  attr_accessor :products

  def calculate_total_cost
    @products.inject(0) do |total, product|
      total + product.total_price
    end
  end

  def render_products
    output = ''
    @products.each do |product|
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

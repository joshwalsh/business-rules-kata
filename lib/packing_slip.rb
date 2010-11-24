class PackingSlip
  attr_accessor :products

  def calculate_total_cost
    total = 0

    @products.each do |product|
      price = product[:price]
      quantity = product[:quantity]
      total += price * quantity
    end

    total
  end

  def render_products
    output = ''
    @products.each do |product|
      output += "#{product[:original]}\n"
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
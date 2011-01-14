class Order
  attr_accessor :products

  def initialize(order_contents)
    @products = []
    order_contents.split("\n").each do |product_line|
      @products << LineItem.new_with_product_line(product_line)
    end
  end

  def order_total
    @products.inject(0) do |total, product|
      total + product.total_price
    end
  end
end


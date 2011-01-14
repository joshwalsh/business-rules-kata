class Order
  attr_accessor :products

  def self.new_with_order_contents(order_contents)
    order = self.new
    order.fetch_products(order_contents)
    order
  end

  def fetch_products(order_contents)
    @products = []
    order_contents.split("\n").each do |product_line|
      @products << LineItem.new_with_product_line(product_line)
    end
  end

  def total_price
    @products.inject(0) do |total, product|
      total + product.total_price
    end
  end
end


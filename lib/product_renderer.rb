class ProductRenderer
  def self.render_product(product)
    "#{product.quantity} x #{product.name} : $#{product.price} => $#{product.total_price}"
  end
end

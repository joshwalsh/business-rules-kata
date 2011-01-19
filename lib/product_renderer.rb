class ProductRenderer
  def self.render_product(product)
    if (product.type == 'membership')
      membership_status = " (activated)"
    end
    "#{product.quantity} x #{product.name} : $#{product.price} => $#{product.total_price}#{membership_status}"
  end
end

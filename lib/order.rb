class Order
  attr_accessor :products

  def initialize(order_file)
    order_contents = File.read(order_file)
 
    @products ||= []
    order_contents.split("\n").each do |product_line|
      @products << LineItem.new_with_product_line(product_line)
    end
  end
end


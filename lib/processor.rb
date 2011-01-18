class Processor
  attr_accessor :order

  def self.new_with_order_file(order_contents)
    processor = self.new
    processor.order = Order.new_with_order_contents(order_contents)
    processor
  end

  def packing_slip
    @packing_slip ||= PackingSlip.new_with_order(@order)
  end

  def process
    packing_slip.render_for "customer"
  end
end

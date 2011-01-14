class Processor
  attr_accessor :order

  def self.new_with_order(order_contents)
    processor = self.new
    processor.order = Order.new(order_contents)
    processor
  end

  def packing_slip
    @packing_slip ||= PackingSlip.new_with_order(@order)
  end

  def render
    packing_slip.render
  end
end

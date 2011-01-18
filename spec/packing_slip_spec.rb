require 'spec_helper'

describe PackingSlip do
  before(:each) { 
    order = mock('Order', total_price: 13000)

    order.stub :products do
      [
        mock('Product', type: 'product', quantity: 3, name: 'violin', price: 2000, total_price: 6000),
        mock('Product', type: 'product', quantity: 2, name: 'cello', price: 3000, total_price: 6000),
        mock('Product', type: 'product', quantity: 1, name: 'trumpet', price: 500, total_price: 500),
        mock('Product', type: 'product', quantity: 1, name: 'flute', price: 500, total_price: 500)
      ]
    end

    @packing_slip = PackingSlip.new_with_order(order)
  }

  it "renders a packing slip" do
    @packing_slip.render.should == <<eos
PACKING SLIP
====================
3 x violin : $2000 => $6000
2 x cello : $3000 => $6000
1 x trumpet : $500 => $500
1 x flute : $500 => $500
---------
Total: $13000
eos
  end
end

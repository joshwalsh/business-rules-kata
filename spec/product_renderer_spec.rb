require 'spec_helper'

describe ProductRenderer do
  it "renderers a product as a line item" do
    product = mock('Product', type: 'product', quantity: 2, name: 'cello', price: 3000, total_price: 9000)

    ProductRenderer.render_product(product).should == "2 x cello : $3000 => $9000"
  end
end

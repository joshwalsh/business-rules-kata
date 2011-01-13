require 'spec_helper'

describe PackingSlip do
  before(:each) { 
    @packing_slip = PackingSlip.new 

    @packing_slip.products = [
      {:original => "3 x violin: $2000", :quantity => 3, :price => 2000},
      {:original => "2 x cello: $3000", :quantity => 2, :price => 3000},
      {:original => "1 x trumpet: $500", :quantity => 1, :price => 500},
      {:original => "1 x flute: $500", :quantity => 1, :price => 500}
    ] 
  }

  it "calculate totals" do
    @packing_slip.calculate_total_cost.should == 13000
  end
  
  it "renders a packing slip" do
    @packing_slip.render.should == <<eos
3 x violin: $2000
2 x cello: $3000
1 x trumpet: $500
1 x flute: $500
---------
Total: $13000
eos
  end
end


__END__

describe PackingSlip do
  before do
    @packing_slip.products = [
      mock('Product', render: 'blah1', cost...),
      mock('Product', render: 'blah2')
    ]
  end

  it "renders a packing slip" do
    @packing_slip.render.should == <<eos
blah1
blah2
-------
Total: xxx

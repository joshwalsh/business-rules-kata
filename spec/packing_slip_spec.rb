require 'spec_helper'

describe PackingSlip do
  before(:each) { 
    @packing_slip = PackingSlip.new 

    @packing_slip.products = [
      {:original => "1 x violin: $2000", :total => 2000},
      {:original => "1 x cello: $3000", :total => 3000},
      {:original => "1 x trumpet: $500", :total => 500},
      {:original => "1 x flute: $500", :total => 500}
    ] 
  }

  it "calculate totals" do
    @packing_slip.calculate_total_cost.should == 6000
  end
  
  it "renders a packing slip" do
    @packing_slip.render.should == <<eos
1 x violin: $2000
1 x cello: $3000
1 x trumpet: $500
1 x flute: $500
---------
Total: $6000
eos
  end
end

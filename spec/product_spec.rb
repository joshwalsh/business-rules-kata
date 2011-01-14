require 'spec_helper'

describe Product do
  subject { Product.new_with_product_line("product, 3, cello, 3000") }

  context "when initialized" do
    its(:type) { should == 'product' }
    its(:quantity) { should == 3 }
    its(:name) { should == 'cello' }
    its(:price) { should == 3000 }
    its(:total_price) { should == 9000 }
  end
end

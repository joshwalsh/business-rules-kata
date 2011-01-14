require 'spec_helper'

describe Product do
  context "when initialized" do
    subject { Product.new_with_product_line("product: 3 x cello = $3000") }

    its(:type) { should == 'product' }
    its(:quantity) { should == 3 }
    its(:name) { should == 'cello' }
    its(:price) { should == 3000 }
  end
end

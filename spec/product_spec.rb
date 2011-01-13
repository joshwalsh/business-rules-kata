require 'spec_helper'

describe Product do
  subject { Product.new }

  context "reads product lines" do
    it "pulls a type from a product line" do
      subject.parse_product_line('product: 4 x violin = $2000')

      subject.type.should == 'product'
    end

    it "pulls a quantity from a product line" do
      subject.parse_product_line('product: 4 x violin = $2000')

      subject.quantity.should == 4
    end

    it "pulls a product from a product line" do
      subject.parse_product_line('product: 4 x violin = $2000')

      subject.product.should == 'violin'
    end

    it "pulls a price from a product line" do
      subject.parse_product_line('product: 1 x violin = $2000')

      subject.price.should == 2000
    end
  end
end

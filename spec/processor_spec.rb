require 'spec_helper'

describe Processor do
  subject { @processor = Processor.new('order.txt') }

  it "returns an array of product lines from order file" do
    File.expects(:read).returns("product: 1 x violin = $2000")
    
    subject.fetch_products.should == ['product: 1 x violin = $2000']
  end

  context "reads product lines" do
    it "pulls a type from a product line" do
      product = subject.parse_product_line('product: 4 x violin = $2000')

      product[:type].should == 'product'
    end

    it "pulls a quantity from a product line" do
      product = subject.parse_product_line('product: 4 x violin = $2000')

      product[:quantity].should == 4
    end

    it "pulls a product from a product line" do
      product = subject.parse_product_line('product: 4 x violin = $2000')

      product[:product].should == 'violin'
    end

    it "pulls a price from a product line" do
      product = subject.parse_product_line('product: 1 x violin = $2000')

      product[:price].should == 2000
    end
  end
end

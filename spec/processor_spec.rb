require 'spec_helper'
require 'processor'

describe Processor do
  subject { @processor = Processor.new }

  context "fetch products from an order file" do
    it "returns an array of product lines" do
      File.expects(:read).returns("1 x violin: $2000")
      
      subject.fetch_products('foo.txt').should == ['1 x violin: $2000']
    end
  end

  context "pulls values from product line" do
    it "pulls a total from a product line" do
      product = subject.parse_product_line('1 x violin: $2000')

      product[:total].should == 2000
    end
  end

  context "calculate totals" do
    it "for a single product" do
      products = [{:total => 2000}]
      subject.expects(:products).returns(products)

      subject.calculate_total_cost.should == 2000
    end
  end
end

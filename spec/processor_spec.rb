require 'spec_helper'
require 'processor'

describe Processor do
  subject { @processor = Processor.new }

  it "returns an array of product lines from order file" do
    File.expects(:read).returns("1 x violin: $2000")
    
    subject.fetch_products('foo.txt').should == ['1 x violin: $2000']
  end

  it "pulls a total from a product line" do
    product = subject.parse_product_line('1 x violin: $2000')

    product[:total].should == 2000
  end

  it "calculate totals" do
    products = [{:total => 2000}]
    subject.expects(:products).returns(products)

    subject.calculate_total_cost.should == 2000
  end
end

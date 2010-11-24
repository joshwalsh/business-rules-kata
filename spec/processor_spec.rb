require 'spec_helper'

describe Processor do
  subject { @processor = Processor.new }

  it "returns an array of product lines from order file" do
    File.expects(:read).returns("1 x violin: $2000")
    
    subject.fetch_products('foo.txt').should == ['1 x violin: $2000']
  end

  it "pulls a price from a product line" do
    product = subject.parse_product_line('1 x violin: $2000')

    product[:price].should == 2000
  end
end

require 'spec_helper'

describe Processor do
  subject { @processor = Processor.new('order.txt') }

  it "returns an array of product lines from order file" do
    File.expects(:read).returns("product: 1 x violin = $2000")
    
    subject.fetch_products.should == ['product: 1 x violin = $2000']
  end

end

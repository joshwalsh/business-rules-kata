require 'spec_helper'

describe Processor do
  subject { @processor = Processor.new('order.txt') }

  before do
    Product.stub(:new_with_product_line) do |product_line|
      "stubbed: " + product_line
    end
  end
  
  it "returns an array of product lines from order file" do
    File.expects(:read).returns("product: 1 x violin = $2000")

    subject.fetch_products.should == ['stubbed: product: 1 x violin = $2000']
  end

end

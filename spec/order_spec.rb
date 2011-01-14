require 'spec_helper'

describe Order do
  subject { Order.new('order.txt') }

  it "fetches products from the order file" do
    File.should_receive(:read).with('order.txt').and_return("product 1\nproduct 2")
    LineItem.stub(:new_with_product_line) do |product_line|
      product_line
    end

    subject.products.should == ['product 1', 'product 2']
  end
end

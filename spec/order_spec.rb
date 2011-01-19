require 'spec_helper'

describe Order do
  context "physical products" do
    before do
      LineItem.stub(:new_with_product_line) do |product_line|
        mock(product_line, name: product_line, total_price:2000)
      end
    end

    subject { Order.new_with_order_contents("product 1\nproduct 2") }

    it "fetches products from the order file" do
      subject.products.map do |product|
        product.name
      end.should == ['product 1', 'product 2']
    end

    it "calculates the total price of the order" do
      subject.total_price.should == 4000
    end
  end

  context "books" do
    before do
      LineItem.stub(:new_with_product_line) do |product_line|
        mock(product_line, name: product_line, type: 'book', total_price:2000)
      end
    end

    subject { Order.new_with_order_contents("product 1\nproduct 2") }

    it "has royalties when a book is sold" do
      subject.has_royalties?.should be_true
    end
  end

  context "memberships" do
    before do
      LineItem.stub(:new_with_product_line) do |product_line|
        mock(product_line, name: product_line, type: 'membership', total_price:2000)
      end
    end

    subject { Order.new_with_order_contents("product 1\nproduct 2") }

    it "has memberships to activate" do
      subject.has_memberships?.should be_true
    end
  end
end

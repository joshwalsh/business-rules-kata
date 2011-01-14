Given /^a customer orders (\d+) (\w+): "([^"]*)" for \$(\d+\.?\d+)$/ do |quantity, type, product, dollars|
  @products ||= []
  type = "product" if type == "products"
  @products << "#{type}, #{quantity}, #{product}, #{dollars}"
end

When /^the order is placed$/ do
  Given 'a file named "order.txt" with:', @products.join("\n")
  run "ruby ../../processor.rb"
end

Then /^I should print a packing slip:$/ do |packing|
  Then 'the output should contain:', packing
end

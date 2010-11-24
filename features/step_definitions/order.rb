Given /^a customer orders (\d+) "([^"]*)" for \$(\d+\.?\d+)$/ do |quantity, product, dollars|
  @products ||= []
  @products << "#{quantity} x #{product}: $#{dollars}"
end

When /^the order is placed$/ do
  Given 'a file named "order.txt" with:', @products.join("\n")
  run "ruby ../../processor.rb"
end

Then /^I should print a packing slip:$/ do |packing|
  Then 'the output should contain:', packing
end
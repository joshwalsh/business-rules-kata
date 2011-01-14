LIB = File.dirname(__FILE__)
require LIB + '/lib/processor'
require LIB + '/lib/packing_slip'
require LIB + '/lib/line_item'
require LIB + '/lib/order'
require LIB + '/lib/product_renderer'

order_file_path = File.dirname(__FILE__) + "/tmp/aruba/order.txt"

runner = Processor.new_with_order(File.read order_file_path)
puts runner.render

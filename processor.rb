LIB = File.dirname(__FILE__)
require LIB + '/lib/processor'
require LIB + '/lib/packing_slip'

ORDER_FILE = File.dirname(__FILE__) + "/tmp/aruba/order.txt"

runner = Processor.new
runner.run

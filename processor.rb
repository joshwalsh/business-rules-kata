LIB = File.dirname(__FILE__)
require LIB + '/lib/processor'

ORDER_FILE = File.dirname(__FILE__) + "/tmp/aruba/order.txt"

runner = Processor.new
runner.run

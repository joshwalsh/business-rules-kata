LIB = File.dirname(__FILE__)
require LIB + '/lib/processor'
require LIB + '/lib/packing_slip'

runner = Processor.new(File.dirname(__FILE__) + "/tmp/aruba/order.txt")
runner.run

class Processor
  attr_reader :products

  def initialize
    @products = []
  end

  def fetch_products(order_file)
    order_contents = File.read(order_file)

    order_contents.split("\n").each do |product_line|
      @products << parse_product_line(product_line)
    end
  end

  def parse_product_line(product_line)
    match = /1 x (\w+): \$(\d+)/.match(product_line)

    if match
      { :original => product_line, :product => match[1], :total => match[2].to_i }
    end
  end

  def calculate_total_cost
    total = 0

    products.each do |product|
      total += product[:total].to_i
    end

    total
  end

  def run
    fetch_products(ORDER_FILE)
    @products.each { |p| puts p[:original] }

    total = calculate_total_cost
    puts "----------\nTotal: $#{total}"
  end
end

puts "here you go"
BEGIN {
  puts "something working underground"
}
END {
  puts "Ending.."
}

# comments

class Customer
  @@no_of_customers = 9
  WEEK_DAYS = 5
  @@colors = {"red" => 0xf00, "green" => 0x0f0}

  def initialize(name, id, addr)
    @cust_id = id
    @cust_name = name
    @cust_addr = addr
  end
  def colors_list()
    @@colors.each_with_index do |key, idx, value|
      puts "#{key} at #{idx} is #{value}"
    end
  end
  def display_details()
    puts "Customer name is #@cust_name"
  end
  def total_customer()
    print "Total number of customer is #@@no_of_customers"
  end
  def salary()
    puts "The #@@no_of_customers workers salary will be based on the #{WEEK_DAYS} working days"
  end
end

cust_1 = Customer.new(1, 'Wale', 'Total, Nigeria')
cust_1.display_details()
cust_1.total_customer()
cust_1.salary()
cust_1.colors_list()
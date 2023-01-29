require_relative 'customer'

class CustomerSuccess
  attr_accessor :id, :score, :customers
  
  def initialize(id: 0, score: 0)
    @id = id
    @score = score
    @customers = []
  end

  def add_customer(customer)
    customer.add_customer_success(self)
    @customers << customer
  end

  def number_customers
    @customers.size
  end
end

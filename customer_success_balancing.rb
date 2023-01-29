require_relative 'models/customer_success'
require_relative 'models/customer'
require_relative 'modules/balancing_conditions'
require_relative 'modules/sort_by_experience_level'

class CustomerSuccessBalancing
  include BalancingConditions
  include SortByExperienceLevel

  attr_accessor :customer_successes, :customers, :away_customer_successes, :available_customer_successes

  def initialize(customer_successes, customers, away_customer_successes)
    @customer_successes = customer_successes
    @customers = customers
    @away_customer_successes = away_customer_successes
    @available_customer_successes = []
  end

  def execute
    if minimum_number_available_customer_successes && maximum_number_customers
      @available_customer_successes = customer_success_sort
      @customers = customers_sort
      @available_customer_successes = allocating_customers_to_customer_success.sort_by(&:number_customers).reverse!
      return customer_success_with_more_customer
    else
      0
    end
  end

  private

  def allocating_customers_to_customer_success
    @customers.each do |customer|
      @available_customer_successes.each do |available_customer_success|
        next if customer.score > available_customer_success.score || customer.customer_success != nil
        available_customer_success.add_customer(customer)
      end
    end
    @available_customer_successes 
  end

  def customer_success_with_more_customer
    available_customer_successes_not_nil unless @available_customer_successes.size.zero?
  end
end

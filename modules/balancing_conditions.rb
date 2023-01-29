module BalancingConditions

  def maximum_number_customers
    @customers.size < 1000000
  end

  def minimum_number_available_customer_successes
    @away_customer_successes.size <= @customer_successes.size / 2
  end
    
  def available_customer_successes_not_nil
    @available_customer_successes.size < 2 ? @available_customer_successes.first.id : maximum_number_customer_successes
  end

  def maximum_number_customer_successes
    @customer_successes.size < 1000 ? tie_between_customer_successes : 0
  end

  def tie_between_customer_successes
    @available_customer_successes.first.customers.size == @available_customer_successes[1].customers.size ? 0 : @available_customer_successes.first.id
  end
end

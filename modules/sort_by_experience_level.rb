module SortByExperienceLevel
  def customer_success_sort
    @customer_successes_sorted = []
    @customer_successes.each do |customer_success|
      unless @away_customer_successes.include?(customer_success[:id])
        @customer_successes_sorted << CustomerSuccess.new(id: customer_success[:id], score: customer_success[:score])
      end
    end
    @customer_successes_sorted.sort_by(&:score)
  end

  def customers_sort
    @customers_sorted = []
    @customers.each do |customer|
      @customers_sorted << Customer.new(id: customer[:id], score: customer[:score])
    end
    @customers_sorted.sort_by(&:score)
  end
end

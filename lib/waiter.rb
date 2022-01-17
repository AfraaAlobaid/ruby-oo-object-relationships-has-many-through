class Waiter
    attr_accessor :name, :exp
    @@all = []
    def self.all 
        @@all
    end

    def initialize(name, exp)
        @name = name
        @exp = exp
        @@all << self
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self }
    end 

    def best_tipper
        meal = meals.max_by {|meal| meal.tip}
        meal.customer
    end

end
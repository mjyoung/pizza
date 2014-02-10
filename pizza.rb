require 'pry'

class Pizza
  attr_accessor :toppings, :delivery_time

  def initialize(toppings=nil)
    if toppings.nil?
      @toppings = [Topping.new('cheese', vegetarian: true)]
    else
      @toppings = toppings
    end
    @delivery_time = 0
  end

  def vegetarian?
    @toppings.all? { |topping| topping.vegetarian == true }
  end

  def add_toppings(topping)
    @toppings << topping
  end

  def deliver!
    @delivery_time = Time.now + 30 * 60
  end

  def late?
    if Time.now > @delivery_time
      true
    else false
    end
  end

end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end

require 'pry'

class Pizza
  attr_accessor :toppings

  def initialize(toppings=nil)
    if toppings.nil?
      @toppings = [Topping.new('cheese', vegetarian: true)]
    else
      @toppings = toppings
    end
  end

  def vegetarian?
    @toppings.all? { |topping| topping.vegetarian == true }
  end

  def add_toppings(topping)
    @toppings << topping
  end

end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end

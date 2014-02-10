class Pizza
  attr_accessor :toppings

  def initialize(*toppings)
    @toppings = toppings.flatten
    @toppings = [Topping.new('cheese', vegetarian: true)] if @toppings == []
  end
end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end

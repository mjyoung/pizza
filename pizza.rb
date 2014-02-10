class Pizza
  attr_accessor :toppings

  def initialize(toppings=nil)
    if toppings.nil?
      @toppings = [Topping.new('cheese', vegetarian: true)]
    else
      @toppings = toppings
    end
  end
end

class Topping
  attr_accessor :name, :vegetarian

  def initialize(name, x: nil, vegetarian: false)
    @name = name
    @vegetarian = vegetarian
  end
end

class Pizza
end

class Topping
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

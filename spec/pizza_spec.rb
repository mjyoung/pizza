require './pizza'

describe Pizza do

  it "exists" do
    expect(Pizza).to be_a(Class)
  end

  describe '.initialize' do

    it "record all of the toppings" do
      toppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]
      pizza = Pizza.new(toppings)
      expect(pizza.toppings).to eq(toppings)
    end

    it "defaults the toppings to cheese only, if the pizza has no toppings" do
      pizza = Pizza.new

      expect(pizza.toppings.size).to eq(1)
      expect(pizza.toppings.first.name).to eq('cheese')
    end
  end

  describe '.vegetarian?' do

    it "tells you if all toppings on a pizza are vegetarian" do
      vegtoppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('onions', vegetarian: true),
        Topping.new('cheese', vegetarian: true)
      ]
      nonvegtoppings = [
        Topping.new('ham'),
        Topping.new('sausage'),
        Topping.new('chicken'),
        Topping.new('cheese', vegetarian: true)
      ]

      vegpizza = Pizza.new(vegtoppings)
      nonvegpizza = Pizza.new(nonvegtoppings)

      expect(vegpizza.vegetarian?).to eq(true)
      expect(nonvegpizza.vegetarian?).to eq(false)
    end
  end

  describe '.add_topping' do
    it "adds a topping to the pizza" do
      initialtoppings = [
        Topping.new('mushrooms', vegetarian: true),
        Topping.new('pepperoni')
      ]

      pizza = Pizza.new(initialtoppings.clone)
      secondtopping = Topping.new('onions', vegetarian: true)

      pizza.add_toppings(secondtopping)

      totalpizza = [initialtoppings,secondtopping].flatten

      expect(pizza.toppings).to eq(totalpizza) #something here
    end
  end

  describe '.deliver!' do
    it "sets a delivery time" do
      pizza = Pizza.new
      pizza.deliver!
      expect(pizza.delivery_time).to_not eq(0)
    end
  end

  describe '.late?' do
    it "is marked late if past the delivery time" do
      pizza = Pizza.new
      pizza.deliver!
      expect(pizza.late?).to eq(false)
      pizza.delivery_time = Time.now - 30
      expect(pizza.late?).to eq(true)
    end
  end

end

describe Topping do
  it "exists" do
    expect(Topping).to be_a(Class)
  end

  describe '.initialize' do

    it "sets the name of the topping" do
      topping = Topping.new('olives')
      expect(topping.name).to eq('olives')
    end

    it "sets whether or not the topping is vegetarian" do
      topping = Topping.new( 'bell peppers', vegetarian: true )
      expect(topping.vegetarian).to eq(true)
    end

  end
end

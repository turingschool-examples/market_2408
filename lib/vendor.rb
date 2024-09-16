require_relative './item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    @inventory[item] || 0
  end


  def stock(item, amount)
    @inventory[item] = check_stock(item) + amount
  end

  def revenue_item1
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    price = item1.price
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    amount = vendor1.inventory[item1]
    price * amount
  end

  def potential_revenue
    revenue_item1
  end
end





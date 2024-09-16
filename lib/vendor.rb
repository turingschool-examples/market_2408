require './lib/item'

class Vendor
  attr_reader :name, :stock_count

  def initialize(name)
    @name = name
    @stock_count = 0
  end

  def inventory
    {}
  end

  def check_stock(item)
    @stock_count
  end

  def stock(item, amount)
    @stock_count =+ amount
  end

end


# @item1 = Item.new({name: 'Peach', price: "$0.75"})
# @item2 = Item.new({name: 'Tomato', price: '$0.50'})
# inventory = {@item1 => amount}

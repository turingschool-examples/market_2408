class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item)
    # 0 unless @inventory[item]
    @inventory[item] || 0
  end

  def stock(item, quantity)
    # binding.pry
    @inventory[item] = quantity
    @inventory[item]
  end
end

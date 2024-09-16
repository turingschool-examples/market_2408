class Vendor
  attr_reader :name,
              :inventory
  
  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, amount)
    @inventory[item] ||= 0
    @inventory[item] += amount
  end

  def check_stock(item)
    return 0 unless @inventory.include?(item)
    @inventory[item]
  end
end

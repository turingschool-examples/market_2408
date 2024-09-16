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

  def potential_revenue
    revenue = 0
    @inventory.each do |item, amount|
      revenue += (item.price * amount)
    end
    revenue

  end
end

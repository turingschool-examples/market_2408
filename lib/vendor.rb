require 'pry'

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

  def potential_revenue
    revenue = 0.00
    @inventory.each do |item|
      quantity = item[1]
      price = item[0].price.tr('$', '').to_f
      revenue += quantity * price
    end
    format('%.2f', revenue)
  end
end

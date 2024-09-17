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

  def potential_revenue
    @inventory.sum do |item, amount|
      item.price.delete('$').to_f * amount
    end
  end
end





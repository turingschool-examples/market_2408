require_relative './item'
require_relative './vendor'

class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end 

  def vendor_names
    list_vendor_names = []
      @vendors.map do |vendor|
        list_vendor_names << vendor.name
    vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.select do |vendor|
      vendor.inventory.any? do |inventory_item, amount|
        inventory_item == item && amount > 0
      end
    end
  end

  def revenue_by_item
    price = item.price
    amount = vendor.inventory.value
    price * amount
  end

  def potential_revenue
    price = item.price
    amount = vendor.inventory.value
  end
end

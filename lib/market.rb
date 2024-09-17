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

  def sorted_item_list
    items = [].flatten
    @vendors.each do |vendor|
      vendor.inventory.each do |item, amount|
        items << item.name
      end
    end
    sorted_items = items.uniq.sort
    sorted_items
  end

  def get_item_quantity(item)
    total = 0

    vendors_that_sell(item).each do |vendor|
      total += vendor.check_stock(item)
    end
      total
  end 

  def total_inventory
    # We will be returning a hash
    # Each key will be an Item object (must be unique)
    # Each value is a hash
      # Within the hash there is an amount: total amaount of the item at the market
      # vendors: all the vendors that sell this item 
    # require'pry';binding.pry

      inventory = {}
        @vendors.each do |vendor|
          vendor.inventory.each do |item, amount|
          inventory[item] = {
            amount: get_item_quantity(item),
            vendors: vendors_that_sell(item)
          }
          end
        end
      inventory
  end
end

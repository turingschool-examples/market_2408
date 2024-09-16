class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell(item)
    @vendors.select { |vendor| vendor.inventory[item] > 0 }
  end
  
  def sorted_item_list
    list_items = @vendors.flat_map do |vendor|
      vendor.inventory.keys.map(&:name)
    end

    list_items.uniq.sort
  end

  def total_inventory
    inventory_list = Hash.new { |hash, key| hash[key] = { quantity: 0, vendors: [] } }

    @vendors.each do |vendor|
      vendor.inventory.each do |item, quantity|
        inventory_list[item][:quantity] += quantity
        inventory_list[item][:vendors] << vendor
      end
    end

    inventory_list
  end

  def overstocked?(item_data)
    item_data[:quantity] > 50 && item_data[:vendors].length > 1
  end

  def overstocked_items
    total_inventory.each_with_object([]) do |(item, data), overstock|
      overstock << item if overstocked?(data)
    end   
  end
end

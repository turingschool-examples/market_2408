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
end

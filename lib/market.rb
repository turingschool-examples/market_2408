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
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    @vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    @vendors.flat_map do |vendor|
      vendor.inventory.map do |item, amount|
        item.name
      end
    end.uniq.sort
  end

  def overstocked_items
    items = @vendors.flat_map do |vendor|
      vendor.inventory.map do |item, amount|
        [item, amount, vendor]
      end
    end
    item_data = items.each_with_object(
      Hash.new do |hash, key|
         hash[key] = { total: 0, vendors: Set.new}
      end 
    ) do |(item, amount, vendor), hash|
      hash[item][:total] += amount
      hash[item][:vendors].add(vendor)
    end

    item_data.select do |item, data|
      data[:vendors].size > 1 && data[:total] > 50
    end.keys
  end
end

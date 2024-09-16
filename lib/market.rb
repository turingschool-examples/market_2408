class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
    # todo
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    # todo
    @vendors
  end

  def vendors_that_sell(item)
    list = []
    @vendors.find_all do |vendor|
      list << vendor if vendor.check_stock(item).to_i > 0
    end
    list
  end

  def sorted_items_list
    items = []
    # loop through each vendor
    @vendors.each do |vendor|
      # loop throug each item
      vendor.inventory.each do |item|
        items << item[0].name
      end
    end
    items.uniq.sort
  end

  def overstock_items
    # find items that are sold by more than one vendor
    temp_items = []
    # loop through each vendor
    @vendors.each do |vendor|
      # loop throug each item
      vendors_for_item = []
      vendor.inventory.each do |item|
        vendors_for_item << vendor if vendor.check_stock(item)
        next unless vendors_for_item.uniq.size != vendors_for_item.size

        # has duplicates
        # report total quantity if over 50
        binding.pry
      end
    end
  end
end

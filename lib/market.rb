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
    # todo
    list = []
    @vendors.find_all do |vendor|
      list << vendor if vendor.check_stock(item).to_i > 0
    end
    list
  end

  def sorted_items_list
    items = []
    sorted_items = []
    # loop through each vendor
    @vendors.each do |vendor|
      # loop throug each item
      vendor.inventory.each do |item|
        items << item[0].name
      end
    end
    items.uniq.sort
  end
end

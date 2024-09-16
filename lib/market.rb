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
end

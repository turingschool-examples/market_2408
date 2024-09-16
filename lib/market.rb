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
end

require 'pry'
class Market
    attr_reader :name,
                :vendors

    def initialize(name)
        @name    = name
        @vendors = []
    end

    def add_vendor(vendor)
        @vendors << vendor
    end
    
    def vendor_names
        @vendors.map(&:name)
    end

    def vendors_that_sell(item)
        @vendors.select do |vendor|
            vendor.inventory.keys.include?(item)
        end
    end

    def total_inventory
        total = Hash.new(0)

        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|
                total[item] += quantity
            end
        end
        total
    end

    def over_stocked_items
        vendor_count = Hash.new(0) #lets have a new storage for keys and values
        @vendors.map do |vendor| #lets iterate through our vendors
            vendor.inventory.keys.each do |item| #for each vendor lets iterate through them
                vendor_count[item] += 1   #as we iterate through each item, we add one as each item is found
            end
        end

        total_quantities = total_inventory
        total_quantities.select do |item, quantity|
            vendor_count[item] > 1 && quantity > 50
        end.keys
    end
end

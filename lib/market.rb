class Market
    attr_reader :name, :vendors

    def initialize(name)
        @name = name
        @vendors = ([])
    end

    def add_vendor(vendor)
        @vendors << vendor
    end

    def vendor_names
        @vendors.map { |vendor| vendor.name }
    end

    def vendors_that_sell(item)
        @vendors.select do |vendor|
            vendor.inventory.include?(item)
        end
    end

    def sorted_item_list
        vendors.flat_map { |vendor| vendor.inventory.keys.map(&:name)}.uniq.sort
    end
end

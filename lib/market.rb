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
        vendor_names = []
        @vendors.each do |vendor|
            vendor_names << vendor.name
        end
        vendor_names
    end

    def vendors_that_sell(item)
        @vendors.find_all do |vendor|
            vendor.inventory.key?(item)
        end
    end
end

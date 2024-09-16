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
        vendor_names = @vendors.map do |vendor|
            vendor.name
        end  
    end

    def vendors_that_sell(item)
        vendor_list = vendors.find_all do |vendor|
            vendor.inventory.include?(item)
        end
        vendor_list
    end
end

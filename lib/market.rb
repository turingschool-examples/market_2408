class Market
    attr_reader :name,
                :vendors

    def initialize(name_param)
        @name = name_param
        @vendors = []
    end

    def add_vendor(vendor_param)
        @vendors << vendor_param
    end

    def vendor_names
        @vendors.map {|vendor| vendor.name}
    end

    def vendors_that_sell(item_param)
        @vendors.find_all{|vendor| vendor.inventory.include?(item_param)}
    end

    def potential_revenue
    end
end

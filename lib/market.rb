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

    def total_inventory
        all_inventory = {}

        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|
                if all_inventory[item]
                    all_inventory[item][:quantity] += quantity
                    all_inventory[item][:vendors] << vendor.name unless all_inventory[item][:vendors].include?(vendor.name)
                else
                    all_inventory[item] = {quantity: quantity, vendors: [vendor.name]}
                end
            end
        end
    all_inventory
    end
end

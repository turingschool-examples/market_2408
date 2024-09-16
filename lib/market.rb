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
        @vendors.map(&:name)
    end

    def vendors_that_sell(item)
        @vendors.select { |vendor| vendor.check_stock(item) > 0}
    end

    def sorted_item_list
    @vendors.flat_map { |vendor| vendor.inventory.keys.map(&:name) }.uniq.sort
    end

    def total_inventory
        inventory = Hash.new { |hash, key| hash[key] = { quantity: 0, vendors: [] } }
      
        @vendors.each do |vendor|
          vendor.inventory.each do |item, details|
            inventory[item][:quantity] += details[:quantity]
            inventory[item][:vendors] << vendor unless inventory[item][:vendors].include?(vendor)
          end
        end     
        inventory
    end

    def overstocked_items(threshold = 50)
        total_inventory.select { |item, details| details[:quantity] >= threshold }
    end
end

class Market

    attr_reader :name, :vendors
    attr_accessor :sorted_item_list

    def initialize(name)
        @name = name
        @vendors = []
    end

    def add_vendor(vendor)
        @vendors << vendor
    end

    def vendor_names
        vendors.map do |vendor|
            vendor.name
        end
    end

    def vendors_that_sell(item)
        vendors.select do |vendor|
          vendor.check_stock(item) > 0 
    end
end

    def sorted_item_list
        all_item_names = vendors.flat_map do |vendor|
            vendor.inventory.keys.map(&:name)  
    end
        all_item_names.uniq.sort  
    end

    def total_inventory
        inventory = {}
        vendors.each do |vendor|
        vendor.inventory.each do |item, quantity|
         
            if inventory[item]
                inventory[item][:quantity] += quantity
                inventory[item][:vendors] << vendor.name unless inventory[item][:vendors].include?(vendor.name)
            else
                inventory[item] = {
                  quantity: quantity,
                  vendors: [vendor.name]
                    }
              end
            end
          end
          inventory 
        end
end

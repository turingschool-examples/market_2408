class Market
require 'date'
    
    attr_reader :name,
                :date

    attr_accessor :vendors

    def initialize(name)
        @name = name
        @vendors = []
        @date = Date.today.strftime('%Y/%m/%d')
    end

    def add_vendor(vendor_object)
        @vendors << vendor_object
    end

    def vendor_names
        @vendors.map do |vendor|
            vendor.name
        end
    end

    def vendors_that_sell(item)
        @vendors.select do |vendor|
            vendor.check_stock(item) > 0 
        end
    end

    def sorted_item_list
        all_items = @vendors.flat_map do |vendor|
            vendor.inventory.keys
        end

        all_items.uniq.sort_by do |item| 
            item.name 
        end
    end

    def total_inventory
        total_inventory = {}
        
        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|

                if total_inventory[item]
                    total_inventory[item][:quantity] += quantity
                    total_inventory[item][:vendors] << vendor unless total_inventory[item][:vendors].include?(vendor)
                else
                    total_inventory[item] = {
                        quantity: quantity,
                        vendors: [vendor]
                    }
                end
            end
        end
        total_inventory
    end

    def overstocked_items
        overstocked_items = []

        total_inventory.each do |item, info|
            if info[:quantity] > 50 && info[:vendors].length > 1
                overstocked_items << item 
            end
        end
        overstocked_items
    end

    def sell(item, quantity)
        if total_inventory[item] && total_inventory[item][:quantity] >= quantity
            total_inventory[item][:quantity] -= quantity 
            true
        else
            false
        end
    end
end

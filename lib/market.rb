require 'date'
class Market
    attr_reader :name,
                :vendors,
                :date
    
    def initialize(name)
        @name = name
        @vendors = []
        @date = Date.today
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
        vendor_list = @vendors.find_all do |vendor|
            vendor.inventory.include?(item)
        end
        vendor_list
    end

    def sorted_item_list
        item_list = []
        @vendors.each do |vendor|
            vendor.inventory.each do |item|
                item_list << item[0].name
            end
        end
        item_list.uniq.sort
    end

    def overstocked_items
        item_totals ={}
        @vendors.each do |vendor|
            vendor.inventory.each do |item,quantity|
               if item_totals[item] == nil
                item_totals[item] = quantity
               else
                item_totals[item] += quantity
               end
            end
        end
        items_above= []
        item_totals.map do |item, quantity|
           if quantity>50
            items_above << item
           end
        end
        items_above
    end

    def total_inventory
        inventory = {}
        @vendors.each do |vendor|
            vendor.inventory.each do |item, quantity|
                if inventory[item] == nil
                    inventory[item] = {total_quantity: quantity,vendors:[vendor]}
                else
                    inventory[item][:total_quantity] += quantity
                    inventory[item][:vendors] <<vendor
                end
            end
        end
        inventory
    end
end

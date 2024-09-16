class Market
    attr_reader :name, :vendors

    def initialize(attrs)
        @name = name
        @vendors = []
    end

    def stock(item, amount)
        @inventory[item] += amount
    end

    def add_vendor(item)
        @vendors << item
    end

    def stock_check(item)
        total_stock = 0
        @vendor.each do |vendor|
            total_stock += vendor.check_stock(item)
        end
        total_stock
    end

    def vendors_that_sell(item)
        @vendors.select { |vendor| vendor.check_stock(item) > 0 }
    end

    def item_names_list
        item_names = @vendors.flat_map do |vendor|
            vendor.inventory.keys.map
        end
        item_names.uniq
    end

    def overstocked_items 
        item_values = {quantity => item}
        @vendors.each do |vendor|
            vendor.inventory.each do |item, amount|
                item_values[item][:quantity] += quantity
                item_values[item][:vendor_count] += 1
            end
        end

        item_values.select do |item, values|
            values[:vendor_count] > 1 && values[:quantity] > 50
        end
    end
end

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
            vendor.inventory.each do |item|
               if item_totals[item[0]] == nil
                item_totals[item[0]] = item[1]
               else
                item_totals[item[0]] += item[1]
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
end

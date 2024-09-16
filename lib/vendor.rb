class Vendor
    attr_reader :name, :inventory
    def initialize(name)
        @inventory = {}
        @name = name
    end

    def check_stock(item)
        @inventory[item] || 0 
    end

    def stock(item, quantity)
        @inventory[item] = (@inventory[item] || 0 )+ quantity
    end

    def potential_revenue
        @inventory.sum do |item,quantity|
            item.price.gsub('$', '').to_f * quantity
        end.round(2)
    end
end

require 'pry'
class Vendor
    attr_reader :name,
                :inventory

    def initialize(name)
        @name      = name
        @inventory = {}
    end

    def check_stock(item)
        @inventory[item] || 0
    end

    def stock(item,quantity = 0)
        @inventory[item] = check_stock(item) + quantity
    end

    def potential_revenue
        total_revenue = 0
        @inventory.each do |item, quantity|
            price = item.price.delete('$').to_f 
            total_revenue += price * quantity
        end
        total_revenue
    end
end

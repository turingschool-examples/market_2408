class Vendor
    attr_reader :name, :inventory
    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantity)
        if @inventory.key?(item)
            inventory[item] = inventory[item] + quantity
        else
            @inventory[item] = quantity
        end
    end

    def check_stock(item)
        if inventory.key?(item)
            inventory[item]
        else
            0
        end
    end

    def potential_revenue
        potential_revenue = 0
                # require 'pry'; binding.pry
        if @inventory.length > 0
            @inventory.each do |item, quantity|
                # require 'pry'; binding.pry
                potential_revenue += item.price * quantity
            end
            potential_revenue
        else
            0
        end
    end
end

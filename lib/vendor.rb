class Vendor
    attr_reader :name,
                :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end

    def stock(item, quantity)
        if check_stock(item) == 0
            @inventory[item] = quantity
        else
            @inventory[item] +=quantity
        end
    end

    def check_stock(item)
        if @inventory[item] == nil
            0
        else
            @inventory[item]
        end
    end

    def potential_revenue
        revenue = 0
        @inventory.each do |item|
            revenue +=item[0].price * item[1]
        end
        revenue
    end
end

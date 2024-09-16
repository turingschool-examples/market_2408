class Vendor

    attr_reader :name,
                :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new(0)
    end

    def check_stock(item)
        @inventory[item]
    end

    def stock(item, amount = 0)
        @inventory[item] += amount 
    end

    def potential_revenue
        @inventory.sum do |item, quantity| 
            item.price.delete('$').to_f * quantity 
        end
    end
end

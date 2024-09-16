class Vendor

    attr_reader :name,
                :inventory

    def initialize(name)
        @name = name
        @inventory = Hash.new { |hash, key| hash[key] = { quantity: 0 } }
    end
  
    def check_stock(item)
        @inventory[item][:quantity]
    end

    def stock(item, quantity)
        @inventory[item][:quantity] += quantity
    end

    def potential_revenue
        @inventory.sum do |item, details|
            item.price * details[:quantity]
        end
    end
end

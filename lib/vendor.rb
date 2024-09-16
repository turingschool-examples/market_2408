class Vendor
  
    attr_reader :name, :inventory, :stock
    attr_accessor :potential_revenue

    def initialize(name)
        @name = name
        @inventory = Hash.new(0) 
    end

    def check_stock(item)
        @inventory[item] ||= 0
        @inventory[item]  
    end

    def stock(item, quantity) 
        @inventory[item] ||= 0
        @inventory[item] += quantity  
    end

    def potential_revenue
        total_revenue = 0
        @inventory.each do |item, quantity|
        item_price = item.price.delete('$').to_f
        total_revenue += item_price * quantity
    end
        total_revenue
    end
end

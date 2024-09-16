class Vendor
    attr_reader :name, :inventory
    def initialize(name)
        @inventory = {}
        @name = name
    end

    def check_stock(item)
        @inventory[item] || 0 
    end

    
end

class Vendor
    attr_reader :name

    attr_accessor :inventory

    def initialize(name)
        @name = name
        @inventory = {}
    end
  

    def stock(item, amount)
        if @inventory.include?(item)
            @inventory[item] += amount
        else
        @inventory[item] = amount
        end
    end
    
    def check_stock(item)
        if @inventory.include?(item) 
            return  @inventory[item]
        else
            0
        end
    end

end

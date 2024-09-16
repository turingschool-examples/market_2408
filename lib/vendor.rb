class Vendor
    attr_reader :name,
                :inventory

    def initialize(name_param)
        @name = name_param
        @inventory = {}
    end

    def check_stock(item_param)
        @inventory[item_param] || 0
    end

    def stock(item_param, quantity_param)
        @inventory[item_param] = check_stock(item_param) + quantity_param
    end
end

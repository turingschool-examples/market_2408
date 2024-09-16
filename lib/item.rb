class Item
    attr_reader :name,
                :price

    def initialize(item_param)
        @name = item_param[:name]
        @price = item_param[:price].delete("$").to_f
    end

end

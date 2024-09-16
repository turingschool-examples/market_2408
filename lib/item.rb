class Item
    attr_reader :name,
                :price
    def initialize(item_info)
        @name = item_info[:name]
        @price = price_to_float(item_info[:price])
    end

    def price_to_float(price)
        new_price = price.gsub("$","")
        new_price.to_f
    end
end

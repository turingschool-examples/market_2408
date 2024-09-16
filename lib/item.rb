class Item
    attr_reader :name, :price

    def initialize(attrs)
        @name = attrs[:name]
        @price = attrs[:price]
    end
end

class Item
attr_reader :name, :price

    def initialize (info)
        @name = info[:name]
        @price = info[:price.gsub(/[^\d.]/, '').to_f]
        #takes out all weird characters and symbols then convert to float
    end

end

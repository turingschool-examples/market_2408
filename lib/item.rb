class Item
  attr_reader :name,
              :price

  def initialize(attributes)
    @name = attributes[:name]
    @price = float_price(attributes[:price])
  end

  def float_price(string_price)
    string_price.delete('$').to_f
  end  
end

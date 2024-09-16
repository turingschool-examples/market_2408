class Item
  attr_reader :name,
              :price_str

  def initialize(item)
    @name = item[:name]
    @price_str = item[:price]
  end

  def price
    @price_str.delete("$").to_f
  end


end

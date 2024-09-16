require 'pry'
require './lib/item'

RSpec.describe Item do
    it 'can initialize' do
        item= Item.new({name: 'Peach', price: "$0.75"})

        expect(item).to be_an_instance_of(Item)
        expect(item.name).to eq("Peach")
        expect(item.price).to eq(0.75)
    end
end
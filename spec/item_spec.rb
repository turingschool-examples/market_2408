require './lib/item'

RSpec.describe Item do
    before(:each) do
        @item = Item.new({name: 'Peach', price: "$0.75"})
    end

    it 'exists' do
        expect(@item).to be_a(Item)
    end

    it 'has a name' do
        expect(@item.name).to eq("Peach")
    end

    it 'has a price' do
        expect(@item.price).to eq(0.75)
    end

    it 'handles different prices' do
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})

        expect(@item2.price).to eq(0.50)
    end
end
require './lib/item'

RSpec.describe Item do
    before(:each) do
        @item = Item.new({name: 'Peach', price: "$0.75"})
    end

    it 'exists' do
        expect(@item).to be_a(Item)
    end

    
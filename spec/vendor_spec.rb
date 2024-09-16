require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it 'can initialize' do
        expect(@vendor.name).to eq("Rocky Mountain Fresh")
        expect(@vendor.inventory).to eq({})
    end

    it 'can check stock'    do 
        expect(@vendor.check_stock(@item1)).to eq 0
    end

    it 'can stock and add to inventory' do
        expect(@vendor.check_stock(@item1)).to eq 0

        @vendor.stock(@item2, 30)
        @vendor.stock(@item2, 10)

        expect(@vendor.check_stock(@item2)).to eq 40
        expect(@vendor.inventory.include?(@item2)).to be true



    end

end
require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    end
    
    it 'exists' do
        expect(@vendor).to be_a(Vendor)
        expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'has an inventory' do
        expect(@vendor.inventory).to eq({})
    end

    it 'checks stocks of items' do
        expect(@vendor.check_stock(@item1)).to eq(0)
    end

    it 'stocks items in inventory' do
        @vendor.stock(@item1, 30)
        expect(@vendor.inventory).to eq({@item1 => 30})
        expect(@vendor.check_stock(@item1)).to eq(30)

        @vendor.stock(@item1, 25)
        expect(@vendor.check_stock(@item1)).to eq(55)
    end

    it 'stocks multiple items'do
        @vendor.stock(@item1, 30)
        @vendor.stock(@item2, 12)

        expect(@vendor.inventory).to eq({@item1 => 30, @item2 => 12})
    end
end

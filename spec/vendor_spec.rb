require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
    before(:each) do
        @vendor_1 = Vendor.new('Rocky Mountain Fresh')
        @item_1 = Item.new({name: 'Peach', price: '$0.75'})
        @item_2 = Item.new({name: 'Apple', price: '$1.00'})
    end
  
    describe '#initialize' do
        it 'exists' do
            expect(@vendor_1).to be_an_instance_of(Vendor)
            expect(@vendor_1.name).to eq('Rocky Mountain Fresh')
            expect(@vendor_1.inventory).to eq({})
        end
    end

    describe '#stock' do
        it 'can add an item to the vendor stock' do
            expect(@vendor_1.inventory.length).to eq(0)
            expect(@vendor_1.inventory).to eq({})
            @vendor_1.stock(@item_1, 30)
            expect(@vendor_1.inventory.length).to eq(1)
            expect(@vendor_1.inventory).to eq({@item_1 => 30})
        end
        it 'can add multiple items to the vendor stock' do
            expect(@vendor_1.inventory.length).to eq(0)
            expect(@vendor_1.inventory).to eq({})
            @vendor_1.stock(@item_1, 30)
            @vendor_1.stock(@item_2, 10)
            expect(@vendor_1.inventory.length).to eq(2)
            expect(@vendor_1.inventory).to eq({@item_1 => 30, @item_2 => 10})
        end

        it 'can add additional stock to an item it already stocks' do
            @vendor_1.stock(@item_1, 30)
            expect(@vendor_1.inventory).to eq({@item_1 => 30})
            @vendor_1.stock(@item_1, 25)
            expect(@vendor_1.inventory).to eq({@item_1 => 55})
        end
    end 

    describe '#check_stock' do
        it 'can check the stock if there are no items' do
            expect(@vendor_1.check_stock(@item_1)).to eq(0)
        end

        it 'can check the stock if there are items' do
            expect(@vendor_1.check_stock(@item_1)).to eq(0)
            @vendor_1.stock(@item_1, 30)
            expect(@vendor_1.check_stock(@item_1)).to eq(30)
        end
    end
end
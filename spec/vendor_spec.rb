require 'pry'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end
    describe "vendor" do
        it 'can initialize' do
            expect(@vendor).to be_an_instance_of(Vendor)
            expect(@vendor.name).to eq("Rocky Mountain Fresh")
            expect(@vendor.inventory).to eq({})
        end
    end

    describe "#stock" do
        it 'can add stock to inventory' do
            @vendor.stock(@item1, 30)
            expect(@vendor.inventory.keys).to eq([@item1])

            @vendor.stock(@item2,20)
            expect(@vendor.inventory.keys).to eq([@item1,@item2])
        end

        it 'can add to the value of existing stock' do
            @vendor.stock(@item1, 30)
            @vendor.stock(@item1,10)

            expect(@vendor.inventory[@item1]).to eq(40)
        end
    end

    describe "#check_stock" do
        it 'can check stock by item' do
            expect(@vendor.check_stock(@item1)).to eq(0)

            @vendor.stock(@item1, 30)
            expect(@vendor.check_stock(@item1)).to eq(30)

            @vendor.stock(@item1,15)
            expect(@vendor.check_stock(@item1)).to eq(45)            
        end
    end

end
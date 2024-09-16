require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do 
    before(:each) do
        @market = Market.new("South Pearl Street Farmers Market")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")    
        @vendor3 = Vendor.new("Palisade Peach Shack")   
    end 

        it 'exists' do
            expect(@market).to be_an_instance_of(Market)
            expect(@market.name).to eq("South Pearl Street Farmers Market")
        end

        it 'can have vendors' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            expect(@market.vendors).to eq [@vendor1, @vendor2, @vendor3]
            expect(@market.vendor_names).to eq[]
        end

        it 'has vendors that sell' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)

            @vendor1.stock(@item1, 35)
            expect(@market.vendors_that_sell(@item1)).to eq(@vendor1)
        end

        it 'has potential revenue' do
            @market.add_vendor(@vendor1)
            @vendor1.stock(@item1, 35)
            @vendor1



end
           



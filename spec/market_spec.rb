require './lib/market'
require './lib/vendor'
require './lib/item'

RSpec.describe Market do
    before(:each) do
        @market_1 = Market.new("South Pearl Street Farmers Market")
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")  
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
    end

    describe '#initialize' do
        it 'exists' do
            expect(@market_1).to be_an_instance_of(Market)
            expect(@market_1.name).to eq("South Pearl Street Farmers Market")
            expect(@market_1.vendors).to eq([])
        end
    end

    describe '#add vendor' do
        it 'can add a vendor to a market' do
            expect(@market_1.vendors).to eq([])
            @market_1.add_vendor(@vendor1)
            expect(@market_1.vendors.length).to eq(1)
            expect(@market_1.vendors).to eq([@vendor1])
        end

        it 'can add multiple vendors to a market' do
            expect(@market_1.vendors).to eq([])
            @market_1.add_vendor(@vendor1)
            @market_1.add_vendor(@vendor2)
            expect(@market_1.vendors.length).to eq(2)
            expect(@market_1.vendors).to eq([@vendor1, @vendor2])
        end
    end

    describe '#vendor_names' do
        it "can return vendor_names if there are no vendors" do
            expect(@market_1.vendor_names).to eq([])
        end

        it "can return vendor_names if there is one vendor" do
            @market_1.add_vendor(@vendor1)
            expect(@market_1.vendor_names).to eq([@vendor1.name])
        end
        it "can return vendor_names if there are multiple vendors" do
            @market_1.add_vendor(@vendor1)
            @market_1.add_vendor(@vendor2)
            expect(@market_1.vendor_names).to eq([@vendor1.name, @vendor2.name])
        end
    end
end
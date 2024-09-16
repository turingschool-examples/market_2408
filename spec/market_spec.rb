require 'pry'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
    before(:each) do
        @market = Market.new("South Pearl Street Farmers Market")
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")
        @vendor3 = Vendor.new("Palisade Peach Shack")  
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65) 
    end

    describe "market" do
        it 'can initialize' do
            expect(@market).to be_an_instance_of(Market)
            expect(@market.name).to eq("South Pearl Street Farmers Market")
            expect(@market.vendors).to eq([])
        
            allow(@market).to receive(:date).and_return("24/02/2023")
            expect(@market.date).to eq("24/02/2023")
        end
    end

    describe "#add_vendor and #vendor_names" do
        it 'can add vendors' do
            @market.add_vendor(@vendor1)
            expect(@market.vendors).to eq([@vendor1])

            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            expect(@market.vendors).to eq([@vendor1,@vendor2,@vendor3])
        end

        it "can return list of vendor names" do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end
    end

    describe "#vendors_that_sell" do
        it 'can list vendors selling specific items' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            expect(@market.vendors_that_sell(@item1)).to eq([@vendor1,@vendor3])
            expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
        end
        it 'can list vendors after additional items have been added' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            @vendor3.stock(@item4, 25)

            expect(@market.vendors_that_sell(@item4)).to eq([@vendor2, @vendor3])

        end
    end

    describe "#sorted_item_list" do
        it 'can provide a list alphabetically with no duplicates' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)

            expect(@market.sorted_item_list).to eq(["Banana Nice Cream","Peach", "Peach-Raspberry Nice Cream","Tomato"])
        end
    end

    describe "#overstocked_items" do
        it 'can give an array of overstocked items' do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)

            expect(@market.overstocked_items).to eq([@item1])
        end
    end

    describe "#total_inventory" do
        it "can give total inventory by item and vendor" do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)

            expect(@market.total_inventory.class).to eq(Hash)
            expect(@market.total_inventory[@item1].class).to eq(Hash)
            expect(@market.total_inventory[@item1].keys).to eq([:total_quantity,:vendors])
            expect(@market.total_inventory[@item1][:total_quantity]).to eq(100)

        end
    end

end
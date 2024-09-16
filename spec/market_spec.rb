require './spec/spec_helper'

RSpec.describe Market do
    before(:each) do
        @market = Market.new("South Pearl Street Farmers Market")

        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")
        @vendor3 = Vendor.new("Palisade Peach Shack")
        
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    it 'can initialize and return initialized variables' do
        expect(@market).to be_an_instance_of(Market)
        expect(@market.name).to eq("South Pearl Street Farmers Market")
        expect(@market.vendors).to eq([])
    end

    it 'can create a vendor and items' do
        expect(@vendor1.name).to eq("Rocky Mountain Fresh")
        expect(@item1.name).to eq("Peach")
        expect(@item2.name).to eq("Tomato")
        expect(@item3.name).to eq("Peach-Raspberry Nice Cream")
        expect(@item4.name).to eq("Banana Nice Cream")
    end

    it 'can create an array of vendors and return their names' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.vendors.length).to eq(3)
        expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'can find vendors that sell an item' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)

        expect(@market.vendors_that_sell(@item1).length).to eq(2)
        expect(@market.vendors_that_sell(@item4).length).to eq(1)
    end

    it 'can find potential revenue for vendors' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)

        @vendor1.potential_revenue

        expect(@vendor1.potential_revenue).to eq(29.75)
        expect(@vendor2.potential_revenue).to eq(345.00)
        expect(@vendor3.potential_revenue).to eq(48.75)
    end

    it 'can provide an overstocked items list' do
        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)
        
        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)
        @vendor2.stock(@item4, 50)
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)
        
        @market.overstocked_items
    end
end
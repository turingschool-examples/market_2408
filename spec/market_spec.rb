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
end
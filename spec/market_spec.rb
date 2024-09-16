require 'spec_helper'
RSpec.describe Item do 
    before(:each) do
        @market = Market.new("South Pearl Street Farmers Market")
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor3 = Vendor.new("Palisade Peach Shack")    
        @vendor2 = Vendor.new("Ba-Nom-a-Nom") 
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    it '#exists' do 
        expect(@market).to be_an_instance_of(Market)
    end

    it '#has a name' do
        expect(@market.name).to eq ("South Pearl Street Farmers Market")
    end
end
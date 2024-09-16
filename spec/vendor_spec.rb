require 'spec_helper'
RSpec.describe Vendor do 
    before(:each) do

        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom") 
        @vendor3 = Vendor.new("Palisade Peach Shack") 
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
        @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    end

    it '#exists' do 
        expect(@vendor1).to be_an_instance_of(Vendor)
        expect(@vendor2).to be_an_instance_of(Vendor)
        expect(@vendor3).to be_an_instance_of(Vendor)
    end

    it '#has a name' do
        expect(@vendor1.name).to eq ("Rocky Mountain Fresh")
        expect(@vendor2.name).to eq ("Ba-Nom-a-Nom")
        expect(@vendor3.name).to eq ("Palisade Peach Shack")
    end

    it '#has inventory' do 
        expect(@vendor1.inventory).to eq({})
        expect(@vendor2.inventory).to eq({})
        expect(@vendor3.inventory).to eq({})
    end

    it '#has stock' do 
        expect(@vendor1.check_stock(@item1)).to eq(0)
        expect(@vendor2.check_stock(@item1)).to eq(0)
        expect(@vendor3.check_stock(@item1)).to eq(0)
    end

    it '#can stock items' do 
        @vendor1.stock(@item1, 30)
        expect(@vendor1.check_stock(@item1)).to eq(30)
        expect(@vendor1.check_stock(@item1)).to_not eq(0)
        expect(@vendor2.check_stock(@item1)).to eq(0)
        @vendor1.stock(@item1, 25)
        expect(@vendor1.check_stock(@item1)).to eq(55)
        expect(@vendor2.check_stock(@item1)).to eq(0)
    end

    it '#can have items in inventory' do
        @vendor1.stock(@item1, 25)
        @vendor1.stock(@item2, 25)
        expect(@vendor1.inventory).to eq({@item1 => 25 , @item2 => 25})
    end

    it '#can determine potential revenue for vendors' do
        @vendor1.stock(@item1, 35)    
        @vendor1.stock(@item2, 7) 
        @vendor2.stock(@item4, 50)    
        @vendor2.stock(@item3, 25)
        @vendor3.stock(@item1, 65)  
        expect(@vendor1.potential_revenue).to eq (29.75)
        expect(@vendor2.potential_revenue).to eq (345.00)
        expect(@vendor3.potential_revenue).to eq (48.75)  
    end
end

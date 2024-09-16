require 'spec_helper'
RSpec.describe Vendor do 
    before(:each) do
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Palisade Peach Shack")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it '#exists' do 
        expect(@vendor1).to be_an_instance_of(Vendor)
        expect(@vendor2).to be_an_instance_of(Vendor)
    end

    it '#has a name' do
        expect(@vendor1.name).to eq ("Rocky Mountain Fresh")
        expect(@vendor2.name).to eq ("Palisade Peach Shack")
    end

    it '#has inventory' do 
        expect(@vendor1.inventory).to eq({})
        expect(@vendor2.inventory).to eq({})
    end

    it '#has stock' do 
        expect(@vendor1.check_stock(@item1)).to eq(0)
        expect(@vendor2.check_stock(@item1)).to eq(0)
    end

    it '#can stock items' do 
        @vendor1.stock(@item1, 30)
        expect(@vendor1.check_stock(@item1)).to eq(30)
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
end

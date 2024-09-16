require 'spec_helper'
RSpec.describe Item do 
    before(:each) do
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Sysco Systems")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it '#exists' do 
        expect(@vendor1).to be_an_instance_of(Vendor)
        expect(@vendor2).to be_an_instance_of(Vendor)
    end

    it '#has a name' do
        expect(@vendor1.name).to eq ("Rocky Mountain Fresh")
        expect(@vendor2.name).to eq ("Sysco Systems")
    end

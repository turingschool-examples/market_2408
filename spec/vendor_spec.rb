require 'spec_helper'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    end

    it 'can initialize and return variables do' do
        expect(@vendor).to be_an_instance_of(Vendor)
        expect(@vendor.name).to eq("Rocky Mountain Fresh")
        expect(@vendor.inventory).to eq({})
    end

    it 'can check inventory' do
        expect(@vendor.check_stock(@item1)).to eq (0)
    end

    it 'can add inventory' do
        @vendor.stock(@item1, 30)
        expect(@vendor.check_stock(@item1)).to eq(30)

        @vendor.stock(@item1, 25)
        expect(@vendor.check_stock(@item1)).to eq(55)

        @vendor.stock(@item2, 12)
        expect(@vendor.check_stock(@item2)).to eq(12)
    end

end
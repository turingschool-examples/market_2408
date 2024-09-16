require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    it 'exists' do

        expect(@vendor).to be_an_instance_of(Vendor)
    end

    it 'can return the vendor name' do

        expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'initially returns and empty hash of inventory' do
        
        expect(@vendor.inventory).to eq({})
    end

    it 'can check the stock of an item' do

        expect(@vendor.check_stock(item1)).to eq(0)
    end

    it 'can stock and item' do
        @vendor.stock(@item1, 30)

        expect(@vendor.inventory).to include(@item1)
        expect(@vendor.check_stock(@item1)).to eq(30)
    end

    it 'can stock more items' do
        @vendor.stock(@item1, 25)

        expect(@vendor.check_stock(@item1)).to eq(55)

    end
end
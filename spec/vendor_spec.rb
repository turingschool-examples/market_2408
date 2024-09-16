require './lib/vendor'
require './lib/item'

RSpec.describe Vendor do
    before(:each) do
        @vendor = Vendor.new("Rocky Mountain Fresh")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    
    it 'exists' do
        expect(@vendor).to be_a(Vendor)
        expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end
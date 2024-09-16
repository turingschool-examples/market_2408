require './spec/spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  describe '#vendor attributes' do
    it 'has a name' do
      expect(@vendor.name).to eq("Rocky Mountain Fresh")
    end

    it 'starts with no inventory' do\
      expect(@vendor.inventory).to eq({})
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
  end

  describe '#inventory process' do
    it 'adds to inventory' do
      @vendor.stock(@item1, 30)      
      expect(@vendor.check_stock(@item1)).to eq(30)
    end
  end
end

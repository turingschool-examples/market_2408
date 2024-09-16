require 'pry'
require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new('Rocky Mountain Fresh')
    @item1 = Item.new({ name: 'Peach', price: '$0.75' })
    @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
  end

  it 'is a Vendor' do
    expect(@vendor).to be_an_instance_of(Vendor)
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@vendor.name).to eq('Rocky Mountain Fresh')
    end
    it 'has an inventory' do
      expect(@vendor.inventory).to eq({})
    end
  end

  describe '#check_stock' do
    it 'can check stock' do
      expect(@vendor.check_stock(@item1)).to eq(0)
    end
    it 'can stock items' do
      @vendor.stock(@item1, 30)
      expect(@vendor.inventory.count).to eq(1)
      expect(@vendor.check_stock(@item1)).to eq(30)
      @vendor.stock(@item1, 25)
      expect(@vendor.check_stock(@item1)).to eq(25)
      @vendor.stock(@item2, 12)
      expect(@vendor.check_stock(@item2)).to eq(12)
      expect(@vendor.inventory.count).to eq(2)
    end
  end

  it 'can calculate potential revenue' do
    @vendor.stock(@item1, 30)
    expect(@vendor.potential_revenue).to eq('22.50')
  end
end

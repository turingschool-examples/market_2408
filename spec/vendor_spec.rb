require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'can initialize' do
    expect(@vendor).to be_instance_of(Vendor)
  end

  it 'has a name' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end

  it 'starts with an empty inventory' do
    expect(@vendor.inventory).to eq({})
  end

  it 'can check stock' do
    expect(@vendor.check_stock(@item1)).to eq(0)
  end

  it 'can stock items' do
    @vendor.stock(@item1, 30)

    expect(@vendor.check_stock(@item1)).to eq(30)
  end

  it 'can have an updated inventory after stocking' do
    @vendor.stock(@item1, 30)

    expect(@vendor.inventory).to eq({@item1 => 30})
  end
    
end
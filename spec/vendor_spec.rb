require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")    
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
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

  it 'can calculate potential revenue' do
    @vendor1.stock(@item1, 35)   
    @vendor1.stock(@item2, 7)
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)  

    expect(@vendor1.potential_revenue).to eq(29.75)
    expect(@vendor2.potential_revenue).to eq(345.00)
    expect(@vendor3.potential_revenue).to eq(48.75)
  end
    
end
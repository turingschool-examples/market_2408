require 'spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")    
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  it 'can be initialized' do
    expect(@market).to be_instance_of(Market)
  end

  it 'has a name' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end

  it 'can list vendors' do
    expect(@market.vendors).to eq([])
  end

  it 'can add vendors to the vendors array' do
    @market.add_vendor(@vendor1)  
    @market.add_vendor(@vendor2)  
    @market.add_vendor(@vendor3)
    
    expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
  end
end
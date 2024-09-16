require 'pry'
require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  before(:each) do
    @item1 = Item.new({ name: 'Peach', price: '$0.75' })
    @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
    @vendor = Vendor.new('Rocky Mountain Fresh')
    @market = Market.new('South Pearl Street Farmers Market')
  end

  it 'is a Market' do
    expect(@market).to be_an_instance_of(Market)
  end
end

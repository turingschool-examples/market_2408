require 'pry'
require 'rspec'
require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({ name: 'Peach', price: '$0.75' })
    @item2 = Item.new({ name: 'Tomato', price: '$0.50' })
  end

  it 'is and Item' do
    expect(@item1).to be_an_instance_of(Item)
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@item1.name).to eq('Peach')
    end
    it 'has a price' do
      expect(@item1.price).to eq('$0.75')
    end
  end
end

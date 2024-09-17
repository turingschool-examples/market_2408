require 'spec_helper'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
  end

  it 'has a name and price' do
    expect(@item2.name).to eq('Tomato')
    expect(@item2.price).to eq('$0.50')
  end
end
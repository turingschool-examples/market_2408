require './spec_helper'

RSpec.describe Item do
  before(:each) do
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe 'initialize' do
    it 'can exist' do
      expect(@peach).to be_an_instance_of(Item)
      expect(@tomato).to be_an_instance_of(Item)
    end

    it 'has a name' do
      expect(@peach.name).to eq("Peach")
      expect(@tomato.name).to eq("Tomato")
      expect(@tomato.name).to !eq("Tom")

    end

    it 'has a price' do
      expect(@peach.price).to eq(.75)
      expect(@tomato.price).to eq(.5)
      expect(@peach.price).to !eq(.5)
    end
  end


end

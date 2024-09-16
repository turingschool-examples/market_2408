require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Bob's Fish Market")
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
  end

  describe '#initialize' do
    it 'can exist' do
      expect(@vendor1).to be_an_instance_of(Vendor)
      expect(@vendor2).to be_an_instance_of(Vendor)
    end

    it 'has a name' do
      expect(@vendor1.name).to eq("Rocky Mountain Fresh")
      expect(@vendor2.name).to eq("Bob's Fish Market")
    end

    it 'defaults to empty hash of inventory' do
      expect(@vendor1.inventory).to eq({})
      expect(@vendor2.inventory).to eq({})
    end
  end

  describe '#stock' do
    it 'can add stock' do
      expect(@vendor1.inventory).to eq({})
      expect(@vendor2.inventory).to eq({})

      @vendor1.stock(@peach, 30)
      expect(@vendor1.inventory).to eq({@peach => 30})
      expect(@vendor2.inventory).to eq({})

      @vendor2.stock(@tomato, 25)
      expect(@vendor1.inventory).to eq({@peach => 30})
      expect(@vendor2.inventory).to eq({@tomato => 25})
    end

    it 'can add to preexisting stock' do
      @vendor1.stock(@peach, 30)
      expect(@vendor1.inventory).to eq({@peach => 30})

      @vendor1.stock(@peach, 25)
      expect(@vendor1.inventory).to eq({@peach => 55})
    end

    it 'can have multiplle items in stock' do
      @vendor1.stock(@peach, 30)
      expect(@vendor1.inventory).to eq({@peach => 30})

      @vendor1.stock(@tomato, 25)
      expect(@vendor1.inventory).to eq({@peach => 30, @tomato => 25})
    end
  end

  describe '#check_stock' do
    it 'can check stock default 0' do
      expect(@vendor1.check_stock(@peach)).to eq(0)
    end

    it 'can return stock of items' do
      @vendor1.stock(@peach, 30)
      expect(@vendor1.check_stock(@peach)).to eq(30)
    end

    it 'can check treh stock if the stock increases' do
      @vendor1.stock(@peach, 30)
      expect(@vendor1.check_stock(@peach)).to eq(30)
      @vendor1.stock(@peach, 25)
      expect(@vendor1.check_stock(@peach)).to eq(55)
    end
  end

  describe '#potential_revenue' do
    it 'can calculate the sum of all their items price * quantity.' do
      @vendor1.stock(@peach, 30)
      expect(@vendor1.potential_revenue).to eq(22.50)
      @vendor1.stock(@tomato, 20)
      expect(@vendor1.potential_revenue).to eq(32.50)
    end
  end
end
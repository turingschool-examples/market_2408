require 'spec_helper'

RSpec.describe Market do
  before(:each) do
    @peach = Item.new({name: 'Peach', price: "$0.75"})
    @tomato = Item.new({name: 'Tomato', price: '$0.50'})
    @egg = Item.new({name: 'Egg', price: "$0.80"})
    @bacon = Item.new({name: 'Bacon', price: '$1.50'})

    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Bob's Fish Market")

    @vendor1.stock(@peach, 25)
    @vendor1.stock(@tomato, 30)

    @vendor2.stock(@peach, 55)
    @vendor2.stock(@egg, 35)
    @vendor2.stock(@bacon, 10)

    @market1 = Market.new("South Pearl Street Farmers Market")
    @market2 = Market.new("Farmer Joe's Emporium")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@market1).to be_an_instance_of(Market)
      expect(@market2).to be_an_instance_of(Market)
    end

    it 'has a name' do
      expect(@market1.name).to eq("South Pearl Street Farmers Market")
      expect(@market2.name).to eq("Farmer Joe's Emporium")
    end

    it 'has an empty array of vendors' do
      expect(@market1.vendors).to eq([])
      expect(@market2.vendors).to eq([])
    end
  end

  describe '#add_vendor' do
    it 'can add a vendor' do
      @market1.add_vendor(@vendor1)
      expect(@market1.vendors).to eq([@vendor1])
      @market2.add_vendor(@vendor2)
      expect(@market2.vendors).to eq([@vendor2])
    end

    it 'can add multiple vendors' do
      @market1.add_vendor(@vendor1)
      expect(@market1.vendors).to eq([@vendor1])

      @market1.add_vendor(@vendor2)
      expect(@market1.vendors).to eq([@vendor1, @vendor2])
    end
  end

  describe '#vendor_names' do
    it 'can list vendors names' do
      @market1.add_vendor(@vendor1)
      expect(@market1.vendor_names).to eq(["South Pearl Street Farmers Market"])

      @market1.add_vendor(@vendor2)
      expect(@market1.vendors).to eq(["South Pearl Street Farmers Market", "Bob's Fish Market"])
    end
  end

  describe '#vendors_that_sell' do
    it 'can list vendor who sell a certain item' do
      @market1.add_vendor(@vendor1)
      @market1.add_vendor(@vendor2)

      expect(@market1.vendors_that_sell(@tomato)).to eq([@vendor1])
    end

    it 'can list multiple vendors who sell the same item' do
      @market1.add_vendor(@vendor1)
      @market1.add_vendor(@vendor2)

      expect(@market1.vendors_that_sell(@peach)).to eq([@vendor1, @vendor2])
    end
  end

end
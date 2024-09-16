require './spec/spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: "$0.50"})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe '#market attributes' do
    it 'exits and has a name' do
      expect(@market).to be_an_instance_of(Market)
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors.length).to eq(0)
    end
  end

  describe '#vendors with inventory' do
    before(:each) do
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 9)
      @vendor3.stock(@item3, 13)
      @vendor2.stock(@item4, 50)
      @vendor3.stock(@item1, 65)      
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it 'can add vendors' do
      expect(@market.vendors.length).to eq(3)
    end

    it 'has a hash of vendors' do
      expect(@market.vendor_names).to eq (["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it 'knows which vendors sell which items' do      
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
   
    it 'return a sorted list of unique items' do
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end

    it 'knows total market inventory' do
      actual_inventory = {
        @item1 => { quantity: 100, vendors: [@vendor1, @vendor3] },
        @item2 => { quantity: 9, vendors: [@vendor1] },
        @item3 => { quantity: 13, vendors: [@vendor3] },
        @item4 => { quantity: 50, vendors: [@vendor2] }
      }
      expect(@market.total_inventory).to eq(actual_inventory)
    end

    it 'returns overstocked items' do
      expect(@market.overstocked_items).to eq([@item1])
    end

    it 'returns market creation date' do
      allow(Date).to receive(:today).and_return(Date.new(1912, 5, 13))
      expect(@market.date).to eq("13/05/1912")
    end

    it 'knows when not to sell item' do
      expect(@market.sell(@item2, 25)).to be false
    end

    it 'sells the item to reduce stock' do
      expect(@market.sell(@item1, 40)).to be true      
      expect(@vendor1.check_stock(@item1)).to eq(0)      
      expect(@vendor3.check_stock(@item1)).to eq(60)
    end
  end
end

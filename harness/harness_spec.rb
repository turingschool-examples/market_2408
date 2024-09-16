require 'pry'
require './lib/item'
require './lib/market'
require './lib/vendor'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe 'Market Spec Harness' do
  before(:each) do 
    @item1 = Item.new({ name: 'Peach', price: "$0.75" })
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack")  
    @market = Market.new("South Pearl Street Farmers Market")

  end

  describe "Iteration 1" do
    it "1. Item Creation" do 
      expect(Item).to respond_to(:new).with(1).argument
      expect(@item1).to be_an_instance_of(Item)
      expect(@item1).to respond_to(:name).with(0).argument
      expect(@item1.name).to eq('Chalkware Piggy Bank')
      expect(@item1.price).to eq(0.75)
    end

    it "2. Vendor Creation" do 
      expect(Vendor).to respond_to(:new).with(1).argument
      expect(@vendor1).to be_a(Vendor)
      expect(@vendor1).to respond_to(:name).with(0).argument
      expect(@vendor1.name).to eq("Rocky Mountain Fresh")
    end

    it "3. Can Stock Inventory" do 
      expect(@vendor1).to respond_to(:stock).with(2).argument
      expect(@vendor1.inventory).to eq({})
      @vendor1.stock(@item1, 24)
      @vendor1.stock(@item1, 11)
      @vendor1.stock(@item2, 10)
      expected = {@item1 => 35, @item2 => 10}
      expect(@vendor1.inventory).to eq expected
    end

    it "4. Can Check Stock" do 
      expect(@vendor1).to respond_to(:check_stock).with(1).argument
      expect(@vendor1.check_stock(@item1)).to eq(0)
      @vendor1.stock(@item1, 24)
      @vendor1.stock(@item1, 11)
      @vendor1.stock(@item2, 10)
      expect(@vendor1.check_stock(@item_1)).to eq(35)
      expect(@vendor1.check_stock(@item_2)).to eq(10)
    end
  end

  describe "Iteration 2" do 
    it "5. Market Creation" do 
      expect(Market).to respond_to(:new).with(1).argument
      expect(@market).to be_a Market
      expect(@market).to respond_to(:name).with(0).argument
      expect(@market.name).to eq("South Pearl Street Farmers Market")
    end

    it "6. Can Add Vendors" do 
      expect(@market).to respond_to(:vendors).with(0).argument
      expect(@market.vendors).to eq([])
      expect(@market).to respond_to(:add_vendor).with(1).argument
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      expect(@market.vendors).to eq([@vendor1, @vendor2])
    end

    it "7. Can List Vendor Names" do 
      expect(@market).to respond_to(:vendor_names).with(0).argument
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it "8. Can Find Vendors Who Sell An Item" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65) 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market).to respond_to(:vendors_that_sell).with(1).argument
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end

    it "9. Can Tell Potential Revenue" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65) 
      
      expect(@vendor1).to respond_to(:potential_revenue).with(0).argument
      expect(@vendor1.potential_revenue).to eq(345.00)
      expect(@vendor2.potential_revenue).to eq(29.75)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end

  describe "Iteration 3" do 
    it "10. Gives Market Total Inventory" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65) 
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market).to respond_to(:total_inventory).with(0).argument
      expect = {
        @item1 => 100,
        @item2 => 7,
        @item3 => 50,
        @item4 => 25
      }
      expect(@market.total_inventory).to eq(expected)
    end

    it "11. Shows Market Overstocked Items" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @vendor3.stock(@item2, 10)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market).to respond_to(:overstocked_items).with(0).argument
      expect(@market.overstocked_items).to eq([@item1])

      @vendor2.stock(@item2, 40)
      expect(@market.overstocked_items).to eq([@item1, @item2])

      @vendor2.stock(@item4, 5)
      expect(@market.overstocked_items).to eq([@item1, @item2, @item4])
    end

    it "12. Lists Items Sorted Alphabetically" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)
      @vendor3.stock(@item2, 10)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market).to respond_to(:sorted_item_list).with(0).argument
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", 'Peach', "Peach-Raspberry Nice Cream", 'Tomato'])
    end
  end

  describe "Iteration 4" do 
    it "13. Market Date" do 
      expect(@market).to respond_to(:date).with(0).argument
      allow(Date).to receive(:today).and_return(Date.parse("2-25-2024"))
      expect(@market.date).to eq("25/02/2024")
    end

    it "14. Can Sell Items" do 
      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)   
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor2.stock(@item2, 30)
      @vendor3.stock(@item1, 65)
      @vendor3.stock(@item2, 10)
      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)

      expect(@market).to respond_to(:sell).with(2).argument 

      # false when item quantity too low
      expect(@market.sell(@item4, 55)).to be false
      expect(@market.sell(@item2, 20)).to be false 

      # return true if enough quantity
      # reduce stock of vendors in order added to market

      expect(@market.sell(@item1, 20)).to be true 
      expect(@vendor1.check_stock(@item1)).to eq 15

      expect(@market.sell(@item2, 20)).to be true
      expect(@vendor1.check_stock(@item2)).to eq 0
      expect(@vendor2.check_stock(@item2)).to eq 17
      expect(@vendor3.check_stock(@item2)).to eq 10
    end
  end
end
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
    it 'exist' do
        market = Market.new("South Pearl Street Farmers Market")

        expect(market.name).to eq("South Pearl Street Farmers Market")
        expect(market.vendors).to eq([])
    end

    it 'has vendors with stock' do
        market = Market.new("South Pearl Street Farmers Market")
        vendor1 = Vendor.new("Rocky Mountain Fresh")
        vendor2 = Vendor.new("Ba-Nom-a-Nom") 
        vendor3 = Vendor.new("Palisade Peach Shack")
        item1 = Item.new({name: 'Peach', price: "$0.75"})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        @vendor1.stock(@item1, 35)
        @vendor1.stock(@item2, 7)

        @vendor2.stock(@item3, 25)
        @vendor2.stock(@item4, 50)

        @vendor3.stock(@item1, 65)

        @market.add_vendor(@vendor1)
        @market.add_vendor(@vendor2)
        @market.add_vendor(@vendor3)

        expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end

    it 'generates revenue' do
        market = Market.new("South Pearl Street Farmers Market")
        vendor1 = Vendor.new("Rocky Mountain Fresh")
        vendor2 = Vendor.new("Ba-Nom-a-Nom")
        vendor3 = Vendor.new("Palisade Peach Shack")
        item1 = Item.new({name: 'Peach', price: "$0.75"})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        
        expect(market.vendor_name).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        expect(market.vendors_that_sell(item1)).to eq
    end

    it 'displays names of items inside of vendors' do
        market = Market.new("South Pearl Street Farmers Market")
        vendor1 = Vendor.new("Rocky Mountain Fresh")
        vendor2 = Vendor.new("Ba-Nom-a-Nom")
        vendor3 = Vendor.new("Palisade Peach Shack")
        item1 = Item.new({name: 'Peach', price: "$0.75"})
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

        expect(vendor.item.keys.sorted_item_list).to eq([])
    end
end
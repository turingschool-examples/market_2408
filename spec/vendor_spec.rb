require './lib/vendor'

RSpec.describe Vendor do
    it 'exist' do
        vendor = Vendor.new("Rocky Mountain Fresh")

        expect(vendor.name).to eq("Rocky Mountain Fresh")
        expect(vendor.inventory).to eq({})
    end

    it 'checks the stock' do
        vendor = Vendor.new("Rocky Mountain Fresh")
        item1 = Item.new({name: "Tomato", price: 1.50})
        item2 = Item.new({name: "Tomato", price: 1.50})

        expect(vendor.check_stock(item1)).to eq(0)

        vendor.stock(item1, 30)

        expect(vendor.check_stock(item1)).to eq(30)

        vendor.stock(item2, 12)

        expect(vendor.check_stock(item2)).to eq(12)
    end 
end
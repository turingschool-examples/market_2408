require './lib/item'
require './lib/vendor' 
require './lib/market'

RSpec.describe Market do
    before(:each) do
        @vendor1 = Vendor.new("Rocky Mountain Fresh")
        @vendor2 = Vendor.new("Ba-Nom-a-Nom")
        @vendor3 = Vendor.new("Palisade Peach Shack")
        @vendor4 = Vendor.new("Choco Monster")
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: "$0.50"})
        @item3 = Item.new({name: 'Peach-Raspberry Nice Cream', price: "$5.30"})
        @item4 = Item.new({name: 'Banana Nice Cream', price: "$4.25"})
        @market = Market.new("South Pearl Street Farmers Market")
    end

    describe '#initialize' do
        it "exists" do
            expect(@market).to be_instance_of(Market)
        end

        it 'has a name' do
            expect(@market.name).to eq("South Pearl Street Farmers Market")
        end

        it 'has a date' do
            expect(@market.date).to eq("2024/09/16")
        end

        it 'starts with an empty array of vendors' do
            expect(@market.vendors).to eq([])
        end
    end

    describe '#vendors' do
        before(:each) do 
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
        end

        it 'can add vendors' do
            expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
        end

        it 'stores vendor names in an array' do
            expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
        end
    end

    describe '#stock' do
        before(:each) do
            @market.add_vendor(@vendor1)
            @market.add_vendor(@vendor2)
            @market.add_vendor(@vendor3)
            @vendor1.stock(@item1, 35)
            @vendor1.stock(@item2, 7)
            @vendor2.stock(@item4, 50)
            @vendor2.stock(@item3, 25)
            @vendor3.stock(@item1, 65)
        end

        it 'identifies vendors that sell items' do
            expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
            expect(@market.vendors_that_sell(@item2)).to eq([@vendor1])
            expect(@market.vendors_that_sell(@item3)).to eq([@vendor2])
            expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
        end

        it 'identifies all items in stock, sorted alphabetically' do
            expect(@market.sorted_item_list).to eq([@item4, @item1, @item3, @item2])
        end

        it 'reports total inventory' do
            expected = {
                @item1 => { quantity: 100, vendors: [@vendor1, @vendor3] },
                @item2 => { quantity: 7, vendors: [@vendor1] },
                @item3 => { quantity: 25, vendors: [@vendor2] },
                @item4 => { quantity: 50, vendors: [@vendor2] },
            }

            expect(@market.total_inventory).to eq(expected)
        end

        it 'updates when new items are added' do
            @market.add_vendor(@vendor4)
            @item5 = Item.new({name: 'Chocolate Almond Butter', price: "$6.25"})
            @vendor4.stock(@item5, 14)

            expected = {
                @item1 => { quantity: 100, vendors: [@vendor1, @vendor3] },
                @item2 => { quantity: 7, vendors: [@vendor1] },
                @item3 => { quantity: 25, vendors: [@vendor2] },
                @item4 => { quantity: 50, vendors: [@vendor2] },
                @item5 => { quantity: 14, vendors: [@vendor4] }
            }
        end

        it 'identifies overstocked items' do
            expect(@market.overstocked_items).to eq([@item1])
        end

        it 'identifies more overstocked items as appropriate' do
            @vendor1.stock(@item4, 75)

            expect(@market.overstocked_items).to eq([@item1, @item4])
        end

        it 'indicates if it has insufficient stock' do
            expect(@market.sell(@item2, 10)).to eq(false)
            expect(@market.sell(@item1, 10)).to eq(true)
        end

    end
end


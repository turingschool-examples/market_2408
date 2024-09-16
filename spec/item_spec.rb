require './lib/item' 

RSpec.describe Item do
    before(:each) do
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
    end

    describe '#initialze' do
        it "exists" do
            expect(@item1).to be_instance_of(Item)
        end

        it 'has a name and a price' do
            expect(@item1.name).to eq("Peach")
            expect(@item1.price).to eq("$0.75")
        end
    end
end

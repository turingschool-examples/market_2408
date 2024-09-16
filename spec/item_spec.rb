require './lib/item'

RSpec.describe Item do
    before(:each) do
        @item_1 = Item.new({name: 'Peach', price: '$0.75'})
    end

    describe "#initialize" do
        it 'exists' do
            expect(@item_1).to be_an_instance_of(Item)
            expect(@item_1.name).to eq('Peach')
            expect(@item_1.price).to eq(0.75)
        end
    end
end
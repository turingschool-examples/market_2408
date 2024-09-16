require './lib/market'

RSpec.describe Market do
    before(:each) do
        @market_1 = Market.new("South Market")
    end

    describe '#initialize' do
        it 'exists' do
            expect(@market_1).to be_an_instance_of(Market)
            expect(@market_1.name).to eq("South Market")
            expect(@market_1.vendors).to eq([])
        end
    end
end
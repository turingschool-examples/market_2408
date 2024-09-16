require 'spec_helper'

RSpec.describe Market do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market") 
  end

  it 'can be initialized' do
    expect(@market).to be_instance_of(Market)
  end

  it 'has a name' do
    expect(@market.name).to eq("South Pearl Street Farmers Market")
  end
end
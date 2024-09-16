require 'spec_helper'

RSpec.describe Vendor do
  before(:each) do
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  it 'can initialize' do
    expect(@vendor).to be_instance_of(Vendor)
  end

  it 'has a name' do
    expect(@vendor.name).to eq("Rocky Mountain Fresh")
  end
end
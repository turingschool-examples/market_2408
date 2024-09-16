require 'spec_helper'
RSpec.describe Item do 
    before(:each) do
        vendor = Vendor.new("Rocky Mountain Fresh")
    end

    it '#exists' do 
        expect(vendor).to be_an_instance_of(Vendor)
    end

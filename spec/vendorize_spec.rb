require 'spec_helper'

describe 'Vendorize' do
  it "must be a module" do
    Vendorize.should be_a Module
  end
end

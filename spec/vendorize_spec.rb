require 'spec_helper'

describe 'Vendorize' do
  it "must be a module" do
    Vendorize.must_be_kind_of Module
  end
end

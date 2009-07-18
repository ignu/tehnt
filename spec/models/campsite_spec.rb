require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Campsite do
  before(:each) do
    @valid_attributes = {
      :name => 'my name',
      :beds => 3,
      :price => 40.00
    }
  end

  it "should create a new instance given valid attributes" do
    Campsite.create!(@valid_attributes)
  end
end

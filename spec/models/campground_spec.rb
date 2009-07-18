require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Campground do

  it { should have_many(:campsites) }
  
  before(:each) do
    @valid_attributes = {
      :name => 'Pretty Campground',
      :description => 'a pretty cool campground'
    }
  end

  it "should create a new instance given valid attributes" do
    Campground.create!(@valid_attributes)
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Reservation do

  fixtures :reservations

  before(:each) do
    @valid_attributes = {
    }
  end

  it "should create a new instance given valid attributes" do
    #TODO: test this Reservation.create!(@valid_attributes)
  end

  # current reservation dates for reference
  # start_date: 2009-07-1  end_date: 2009-07-7
  # start_date: 2009-07-5   end_date: 2009-07-7
  # start_date: 2009-06-21   end_date: 2009-06-29

  it "should return a reservations the search criteria overlaps" do
    reservations = Reservation.for_date_requested(Time.local(2009,7,2),Time.local(2009,7,3))
    reservations.length.should == 1;
  end


  it "should handle other other scenarios" do
    Reservation.for_date_requested(Time.local(2009,5,2),Time.local(2009,8,3)).length.should == 3;
    Reservation.for_date_requested(Time.local(2009,6,12),Time.local(2009,6,21)).length.should == 1;
    Reservation.for_date_requested(Time.local(2009,6,28),Time.local(2009,6,30)).length.should == 1;
  end
end

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Booking do
  it { should belong_to(:campsite) }
  it { should belong_to(:reservation) }
  
  describe "registrants access" do
    before(:each) do
      @registrant1 = Registrant.new
      @registrant2 = Registrant.new
      @registrants = [@registrant1, @registrant2]
      @booking = Booking.new
      @booking.stub!(:reservation => mock(Reservation, {
        :registrants =>  @registrants
      }))
    end
    
    it "primary registrant accessible through primary_registrant" do
      @booking.primary_registrant.should == @registrant1
    end
    
    it "secondary registrant accessible through secondary_registrant" do
      @booking.secondary_registrant.should == @registrant2
    end
  end
  describe "csv serialization" do
    before(:each) do
      # data expected to be in the CSV
      registrant_included_data  = %w(first_name last_name address zip address_state city position phone)
      reservation_included_data = %w(start_date end_date group_type group_number district_name 
                                     other_group_name num_boys num_girls num_adults arrival_time departure_time)
      campsite_included_data    = %w(name)
      campground_included_data  = %w(name)
      
      # mocks
      mock_registrant = mock(Registrant, {
        :first_name => 'Guy',
        :last_name  => 'Personson',
        :address    => '123 Foobaz Rd',
        :zip        => '123456',
        :address_state => 'MI',
        :city => 'Thereville',
        :position => 'Leaders',
        :phone => '1234567890'
      })
      primary_registrant = mock_registrant
      secondary_registrant = mock_registrant
      
      reservation = mock(Reservation,{
        :start_date => Time.now,
        :end_date   => Time.now,
        :group_type => 'foo',
        :group_number => '12',
        :council_name => 'bar',
        :district_name => 'baz',
        :other_group_name => 'qux',
        :num_boys => 22,
        :num_girls => 12,
        :num_adults => 4,
        :arrival_time => Time.now,
        :departure_time => Time.now,
        :registrants => [primary_registrant, secondary_registrant]
      })
      campground = mock(Campground, {
        :name => 'here'
      })
      campsite    = mock(Campsite, {
        :name => 'there',
        :campground => campground
      })
      
      @booking = Booking.new
      @booking.stub!({
        :reservation => reservation,
        :campsite    => campsite,
        
      })
      
      # expectations
      reservation_included_data.each do |attribute|
        reservation.should_receive(attribute)
      end
      
      registrant_included_data.each do |attribute|
        primary_registrant.should_receive(attribute)
        secondary_registrant.should_receive(attribute)
      end
      
      campsite_included_data.each do |attribute|
        campsite.should_receive(attribute)
      end
      
      campground_included_data.each do |attribute|
        campground.should_receive(attribute)
      end
    end
    
    it 'becomes a csv formatted string' do
      @booking.to_csv.should be_kind_of(String)
    end
  end
end
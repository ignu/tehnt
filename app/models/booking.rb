class Booking < ActiveRecord::Base
  belongs_to :campsite
  belongs_to :reservation
  
  def primary_registrant
    self.reservation.registrants.first
  end
  
  def secondary_registrant
    self.reservation.registrants[1]
  end
  
  def to_csv
    [ reservation.start_date,
      reservation.end_date,
      campsite.name,
      campsite.campground.name,
      reservation.group_type,
      reservation.group_number,
      reservation.council_name,
      reservation.district_name,
      reservation.other_group_name,
      reservation.num_boys,
      reservation.num_girls,
      reservation.num_adults,
      reservation.arrival_time,
      reservation.departure_time,
      primary_registrant.first_name,
      primary_registrant.last_name,
      primary_registrant.address,
      primary_registrant.zip,
      primary_registrant.address_state,
      primary_registrant.city,
      primary_registrant.position,
      primary_registrant.phone,
      secondary_registrant.first_name,
      secondary_registrant.last_name,
      secondary_registrant.address,
      secondary_registrant.zip,
      secondary_registrant.address_state,
      secondary_registrant.city,
      secondary_registrant.position,
      secondary_registrant.phone
    ].to_csv
  end
end
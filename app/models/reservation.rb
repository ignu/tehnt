class Reservation < ActiveRecord::Base 
  has_many :registrants
  has_many :bookings
  has_many :campsites, :through => :bookings

  validates_presence_of :campsite_id
  
  named_scope :for_date_requested, lambda { |start_date, end_date| {
    :conditions =>  [" ( start_date <= ? AND end_date >= ? ) OR ( start_date >= ? AND start_date <= ? ) OR ( end_date >= ? AND end_date <= ? )", start_date, end_date, start_date, end_date, start_date, end_date ] 
    }
  }
end

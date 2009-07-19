class Reservation < ActiveRecord::Base 
  has_many :registrants
  has_and_belongs_to_many :campsites  
  
  named_scope :for_date_requested, lambda { |start_date, end_date| {
    :conditions => ["start_date = ?", start_date ]
    }
  } 
  
 
end
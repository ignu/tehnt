class Reservation < ActiveRecord::Base 
  has_many :registrants
  has_and_belongs_to_many :campsites  
  
  named_scope :for_date_requested, lambda { |start_date, end_date| {
    :conditions =>  [" ( start_date <= ? AND end_date >= ? ) OR ( start_date >= ? AND start_date <= ? ) OR ( end_date >= ? AND end_date <= ? )", start_date, end_date, start_date, end_date, start_date, end_date ] 
    }
  } 
  #named_scope :starts_after, lambda { |start_date| { :conditions => ["start_date >= ?", start_date ] }  }

 
end

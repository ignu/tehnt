class Reservation < ActiveRecord::Base 
  has_many :registrants
  has_many :bookings
  has_many :campsites, :through => :bookings
  
  named_scope :for_date_requested, lambda { |start_date, end_date| {
    :conditions =>  [" ( start_date <= ? AND end_date >= ? ) OR ( start_date >= ? AND start_date <= ? ) OR ( end_date >= ? AND end_date <= ? )", start_date, end_date, start_date, end_date, start_date, end_date ] 
    }
  } 
  
  def total_cost
    total = 0
    if in_council
      campsites.each do |c|
        total += c.price
      end
    else
      campsites.each do |c|
        total += c.ooc_price
      end
    end
    total    
  end
end

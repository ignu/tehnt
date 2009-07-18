class Reservation < ActiveRecord::Base 
  has_many :registrants
  has_one :campsite  
  validates_presence_of :start_date          
  validates_presence_of :end_date            
  validates_presence_of :group_type          
  validates_presence_of :group_number        
  validates_presence_of :council_name        
  validates_presence_of :district_name       
  validates_presence_of :other_group_name
  
  named_scope :for_week_of, lambda { |year, month, day| {
    :conditions => ["strftime('%W', start_date) = ?", "#{year}-#{month}-#{day}".to_date.strftime('%W') ]
    }
  }    
 

  
    
end    

 
  
  
  
  
  
  
  
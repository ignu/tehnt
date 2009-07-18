class Reservation < ActiveRecord::Base   
  validates_presence_of :start_date          
  validates_presence_of :end_date            
  validates_presence_of :group_type          
  validates_presence_of :group_number        
  validates_presence_of :council_name        
  validates_presence_of :district_name       
  validates_presence_of :other_group_name    
  validates_format_of :zip, 
                      :with => /\d\d\d\d\d/, 
                      :message => I18n.t('sharespost.registration.errors.five-digit-zip'), 
                      :allow_blank => true  

  
    
end    

 
  
  
  
  
  
  
  
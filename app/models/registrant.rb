class Registrant < ActiveRecord::Base 
  belongs_to :reservation
  validates_presence_of :first_name,    :on => :create
  validates_presence_of :last_name,     :on => :create
  validates_presence_of :screename,     :on => :create
  validates_presence_of :email,         :on => :create
  validates_presence_of :zip,           :on => :create  
  validates_presence_of :address,       :on => :create  
  validates_presence_of :city,          :on => :create  
  validates_presence_of :phone,         :on => :create  
  validates_presence_of :address_state, :on => :create
  validates_format_of :zip, 
                      :with => /\d\d\d\d\d/, 
                      :allow_blank => true 
end                                   
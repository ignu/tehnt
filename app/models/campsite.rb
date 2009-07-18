class Campsite < ActiveRecord::Base
  self.belongs_to(:campground)  
  has_and_belongs_to_many :reservations
end

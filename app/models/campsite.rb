class Campsite < ActiveRecord::Base
  self.belongs_to(:campground)
  self.has_many(:bookings)
  self.has_many(:reservations, :through => :bookings)
end

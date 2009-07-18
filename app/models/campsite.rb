class Campsite < ActiveRecord::Base
  self.belongs_to(:campground)
  has_many :reservations
end

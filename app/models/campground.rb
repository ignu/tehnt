class Campground < ActiveRecord::Base
  self.has_many(:campsites)
end

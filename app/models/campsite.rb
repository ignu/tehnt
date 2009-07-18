class Campsite < ActiveRecord::Base
  self.belongs_to(:campground)
end

class Campsite < ActiveRecord::Base
  self.belongs_to(:campground)
  self.has_many(:bookings)
  self.has_many(:reservations, :through => :bookings) do
    # (c <= a AND d > a) OR ( c >= a AND c < b)
    def between(starting,ending)
      self.find(:all, {:conditions => ["(? <= start_date AND ? > start_date) OR (? >= start_date AND ? < end_date)", starting, starting, starting, ending]})
    end
  end
end

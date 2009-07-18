class AddCampgrounds < ActiveRecord::Migration          
  def self.up

    campground = Campground.new({
      :name => "Munhacke",
      :description =>"Camp Munhacke is council's primary camp at 120 acres. It has a Dining Hall and is located in Gregory Michigan."})

    campground.save!

    campground = Campground.new({
      :name => "Teetonkah",
      :description =>"Camp Teetonkahn is the second-oldest Boy Scout camp in America. The camp can be found on Jackson County's Big Wolf Lake and features a new dining hall, two cabins, Adirondack shelters and seven campsites."})

    campground.save!

    campground = Campground.new({
      :name => "Muscootah",
      :description =>"Camp Muscootah is a 66-acre (0.27 km2) camp located five minutes west of Hillsdale, Michigan. The camp offers 13 campsites, an open pavilion, and a large firebowl."})

    campground.save!

  end

  def self.down
    Campground.delete_all
  end
end

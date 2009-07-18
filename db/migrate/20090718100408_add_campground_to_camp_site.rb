class AddCampgroundToCampSite < ActiveRecord::Migration
  def self.up
    add_column :campsites, :campground_id, :integer
  end

  def self.down
    remove_column :campsites, :campground_id
  end
end

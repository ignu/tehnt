class AddReservationIdToRegistrant < ActiveRecord::Migration
  def self.up  
    add_column :registrants, :reservation_id, :integer
  end

  def self.down
    remove_column :registrants, :reservation_id
  end
end

class AddCampsiteIdToReservation < ActiveRecord::Migration
  def self.up
    add_column :reservations, :campsite_id, :integer
  end

  def self.down
    remove_column :reservations, :campsite_id
  end
end

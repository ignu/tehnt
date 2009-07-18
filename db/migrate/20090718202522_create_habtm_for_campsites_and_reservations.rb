class CreateHabtmForCampsitesAndReservations < ActiveRecord::Migration
  def self.up
    create_table :campsites_reservations, :id => false do |t|
      t.integer :campsite_id
      t.integer :reservation_id
    end
  end

  def self.down
    drop_table :campsites_reservations
  end
end

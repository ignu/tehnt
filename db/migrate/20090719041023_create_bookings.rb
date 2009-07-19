class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.references :campsite
      t.references :reservation
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end

class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.string :group_type
      t.integer :group_number
      t.string :council_name
      t.string :district_name
      t.string :other_group_name
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end

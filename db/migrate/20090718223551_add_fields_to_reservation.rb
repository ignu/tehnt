class AddFieldsToReservation < ActiveRecord::Migration
  def self.up   
    add_column :reservations, :num_boys, :integer
    add_column :reservations, :num_girls, :integer
    add_column :reservations, :num_adults, :integer
    add_column :reservations, :arrival_time, :string
    add_column :reservations, :departure_time, :string
  end

  def self.down
    remove_column :reservations, :departure_time
    remove_column :reservations, :arrival_time
    remove_column :reservations, :num_adults
    remove_column :reservations, :num_girls
    remove_column :reservations, :num_boys
  end
end

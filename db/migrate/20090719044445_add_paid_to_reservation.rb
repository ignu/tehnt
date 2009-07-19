class AddPaidToReservation < ActiveRecord::Migration
  def self.up
    add_column :reservations, :paid_in_full, :boolean, :null => false, :default=>false
  end

  def self.down
    remove_column :reservations, :paid_in_full
  end
end

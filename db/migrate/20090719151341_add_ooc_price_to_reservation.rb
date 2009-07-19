class AddOocPriceToReservation < ActiveRecord::Migration
  def self.up 
    add_column :reservations, :in_council, :boolean, :default => true
    add_column :campsites, :ooc_price, :float
  end

  def self.down
    remove_column :campsites, :ooc_price
    remove_column :reservations, :in_council
  end
end

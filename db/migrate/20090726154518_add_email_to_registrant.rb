class AddEmailToRegistrant < ActiveRecord::Migration
  def self.up
    add_column :registrants, :email, :string
  end

  def self.down
    remove_column :registrants, :email
  end 
end

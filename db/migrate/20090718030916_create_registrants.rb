class CreateRegistrants < ActiveRecord::Migration
  def self.up
    create_table :registrants do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :zip
      t.string :address_state
      t.string :city
      t.string :position
      t.string :phone 
      t.timestamps
    end
  end

  def self.down
    drop_table :registrants
  end
end

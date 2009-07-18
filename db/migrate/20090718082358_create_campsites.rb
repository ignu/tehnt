class CreateCampsites < ActiveRecord::Migration
  def self.up
    create_table :campsites do |t|
      t.string      :name
      t.integer     :beds
      t.float       :price
      t.timestamps
    end
  end

  def self.down
    drop_table :campsites
  end
end

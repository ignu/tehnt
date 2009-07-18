class CreateCampgrounds < ActiveRecord::Migration
  def self.up
    create_table :campgrounds do |t|
      t.string :name, :null => false
      t.string :description, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :campgrounds
  end
end

class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
          t.string    :first_name,          :null => false
          t.string    :last_name,           :null => false
          t.string    :login,               :null => false                # optional, you can use email instead, or both
          t.string    :email,               :null => false                # optional, you can use login instead, or both
   
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end

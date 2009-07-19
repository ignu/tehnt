class RemoveCampsiteId < ActiveRecord::Migration
  def self.up
    remove_column :reservations, :campsite_id
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

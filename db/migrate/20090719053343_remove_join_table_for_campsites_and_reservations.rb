class RemoveJoinTableForCampsitesAndReservations < ActiveRecord::Migration
  def self.up
    drop_table(:campsites_reservations)
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end

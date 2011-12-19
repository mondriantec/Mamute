class AddIrtdIdToCartorios < ActiveRecord::Migration
  def self.up
    add_column :cartorios, :irtd_id, :integer
    add_index :cartorios, :irtd_id
  end

  def self.down
    remove_column :cartorios, :irtd_id
  end
end

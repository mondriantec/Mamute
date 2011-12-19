class AddIrtdIdToRepassesFabrica < ActiveRecord::Migration
  def self.up
    add_column :repasses_fabrica, :irtd_id, :integer
    add_index :repasses_fabrica, :irtd_id
  end

  def self.down
    remove_column :repasses_fabricas, :irtd_id
  end
end

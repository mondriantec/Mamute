class AssociaCertidaoDocumento < ActiveRecord::Migration
  def self.up
    add_column :certidaos, :documento_id, :integer
    add_index :certidaos, :documento_id
  end

  def self.down
    remove_column :certidaos, :documento_id
  end
end

class AddColumnDocumentosClienteId < ActiveRecord::Migration
  def self.up
    add_column :documentos, :cliente_id, :integer
  end

  def self.down
    remove_column :documentos, :cliente_id
  end
end

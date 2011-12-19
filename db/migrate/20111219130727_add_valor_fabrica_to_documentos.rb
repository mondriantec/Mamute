class AddValorFabricaToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :valor_fabrica, :float, :default => 0
    add_column :documentos, :repasse_fabrica_id, :integer
    add_index :documentos, :repasse_fabrica_id
  end

  def self.down
    remove_column :documentos, :valor_fabrica
    remove_column :documentos, :repasse_fabrica_id, :integer
  end
end

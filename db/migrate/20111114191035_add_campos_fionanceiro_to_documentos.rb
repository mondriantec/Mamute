class AddCamposFionanceiroToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :status_financeiro, :integer
    add_column :documentos, :valor_cobrado, :float
    add_column :documentos, :fatura_id, :integer
    add_index :documentos, :fatura_id
  end

  def self.down
    remove_column :documentos, :fatura_id
    remove_column :documentos, :valor_cobrado
    remove_column :documentos, :status_financeiro
  end
end

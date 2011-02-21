class IncluirCampoOrdemCampodocumentos < ActiveRecord::Migration
  def self.up
	add_column :campo_documentos, :ordem, :integer
  end

  def self.down
	remove_column :campo_documentos, :ordem
  end
end

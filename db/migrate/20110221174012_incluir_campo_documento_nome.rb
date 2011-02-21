class IncluirCampoDocumentoNome < ActiveRecord::Migration
  def self.up
	add_column :campo_documentos, :nome, :string
  end

  def self.down
	remove_column :campo_documentos, :nome 
  end
end

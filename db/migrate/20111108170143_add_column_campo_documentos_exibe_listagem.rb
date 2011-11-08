class AddColumnCampoDocumentosExibeListagem < ActiveRecord::Migration
  def self.up
      add_column :campo_documentos, :exibe_listagem, :boolean
  end

  def self.down
      remove_column :campo_documentos, :exibe_listagem
  end
end

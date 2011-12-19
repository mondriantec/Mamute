class RenTipoDeDocumentoOnMovimentos < ActiveRecord::Migration
  def self.up
    rename_column :movimentos, :tipo_de_documento, :tipo_de_documento_id
  end

  def self.down
    rename_column :movimentos, :tipo_de_documento_id, :tipo_de_documento
  end
end

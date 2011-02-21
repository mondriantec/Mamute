class RenomearTipocampoIdForTipoCampo < ActiveRecord::Migration
  def self.up
	rename_column :campo_documentos, :tipo_campo_id, :tipo_campo
	change_column :campo_documentos, :tipo_campo, :string
  end

  def self.down
	rename_column :campo_documentos, :tipo_campo , :tipo_campo_id
	change_column :campo_documentos, :tipo_campo_id, :integer
  end
end

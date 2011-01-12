class CreateCampoDocumentos < ActiveRecord::Migration
  def self.up
    create_table :campo_documentos do |t|
      t.integer :tipo_documento_id
      t.integer :tipo_campo_id
      t.tring :nome
      t.integer :limite
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :campo_documentos
  end
end

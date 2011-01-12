class CreateValorCampoDocumentos < ActiveRecord::Migration
  def self.up
    create_table :valor_campo_documentos do |t|
      t.integer :documento_id
      t.integer :campo_documento_id
      t.text :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :valor_campo_documentos
  end
end

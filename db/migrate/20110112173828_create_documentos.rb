class CreateDocumentos < ActiveRecord::Migration
  def self.up
    create_table :documentos do |t|
      t.integer :tipo_documento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :documentos
  end
end

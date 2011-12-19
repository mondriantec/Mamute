class CreateTiposDeDocumento < ActiveRecord::Migration
  def self.up
    create_table :tipos_de_documento do |t|
      t.string :descricao, :null => false
      t.integer :entidade_id
      t.timestamps
    end

   add_index :tipos_de_documento, :entidade_id
  end

  def self.down
    drop_table :tipos_de_documento
  end
end

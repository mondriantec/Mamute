class CreateMovimentos < ActiveRecord::Migration
  def self.up
    create_table :movimentos do |t|
      t.float :valor, :null => false
      t.integer :depositario_id, :null => false
      t.text :observacao
      t.string :documento_type, :null => false
      t.integer :documento_id, :null => false
      t.date :data_contabil, :null => false
      t.date :data_vencimento, :null => false
      t.date :data_pagamento
      t.integer :entidade_id, :null => false
      t.integer :sub_depositario_id
      t.string :tipo_movimento
      t.string :numero_documento
      t.integer :tipo_de_documento
      t.string :fornecedor
      t.string :numero_transacao
      t.integer :usuario_id
      t.timestamps
    end
  add_index :movimentos, :depositario_id
  add_index :movimentos, :documento_id
  add_index :movimentos, :sub_depositario_id
  add_index :movimentos, :data_contabil
  add_index :movimentos, :data_vencimento
  add_index :movimentos, :data_pagamento
  add_index :movimentos, :usuario_id
  end

  def self.down
    drop_table :movimentos
  end
end

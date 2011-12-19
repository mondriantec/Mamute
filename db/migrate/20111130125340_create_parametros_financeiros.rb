class CreateParametrosFinanceiros < ActiveRecord::Migration
  def self.up
    create_table :parametros_financeiros do |t|
      t.references :tipo_documento, :null => false
      t.integer :qtd_paginas_inicial, :null => false
      t.float :valor_qtd_inicial, :null => false
      t.integer :qtd_pag_extra
      t.float :valor_qtd_extra
      t.float :valor_limite
      t.integer :usuario_id, :null => false
      t.integer :entidade_id, :null => false
      t.timestamps
    end
   add_index :parametros_financeiros, :tipo_documento_id
   add_index :parametros_financeiros, :entidade_id
   add_index :parametros_financeiros, [:tipo_documento_id, :entidade_id], :unique => true
 
  end

  def self.down
    drop_table :parametros_financeiros
  end
end

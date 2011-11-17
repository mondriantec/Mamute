class CreateDescontos < ActiveRecord::Migration
  def self.up
    create_table :descontos do |t|
      t.integer :cartorio_id, :null => false
      t.float :valor, :null => false
      t.integer :status, :null => false
      t.integer :item_repasse_id
      t.date :data_pagamento
      t.text :motivo
      t.integer :usuario_id, :null => false
      t.integer :depositario_id
      t.integer :sub_depositario_id
      t.timestamps
    end

   add_index :descontos, :cartorio_id
   add_index :descontos, :item_repasse_id
   add_index :descontos, :usuario_id
   add_index :descontos, :depositario_id 
   add_index :descontos, :sub_depositario_id 

  end

  def self.down
    drop_table :descontos
  end
end

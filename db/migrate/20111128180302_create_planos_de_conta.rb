class CreatePlanosDeConta < ActiveRecord::Migration
  def self.up
    create_table :planos_de_conta do |t|
      t.string :codigo_conta, :null => false
      t.integer :parent_id
      t.string :descricao, :null => false
      t.string :tipo, :null => false
      t.boolean :lancavel
      t.timestamps
    end

   add_index :planos_de_conta, :codigo_conta, :unique => true
   add_index :planos_de_conta, :parent_id
   add_index :planos_de_conta, :tipo
  end

  def self.down
    drop_table :planos_de_conta
  end
end

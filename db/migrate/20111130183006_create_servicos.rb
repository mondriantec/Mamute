class CreateServicos < ActiveRecord::Migration
  def self.up
    create_table :servicos do |t|
      t.string :descricao, :null => false
      t.integer :usuario_id, :null => false
      t.timestamps
    end
    add_index :servicos, :usuario_id 
  end

  def self.down
    drop_table :servicos
  end
end

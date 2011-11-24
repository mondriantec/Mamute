class CreateDepositarios < ActiveRecord::Migration
  def self.up
    create_table :depositarios do |t|
      t.string :descricao, :null => false
      t.boolean :tipo
      t.string :agencia
      t.string :conta
      t.string :banco
      t.integer :entidade_id, :null => false
      t.timestamps
    end
  add_index :depositarios, :entidade_id
  end

  def self.down
    drop_table :depositarios
  end
end

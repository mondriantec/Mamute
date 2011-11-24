class CreateFaturas < ActiveRecord::Migration
  def self.up
    create_table :faturas do |t|
      t.date :vencimento, :null => false
      t.integer :status, :null => false
      t.float :valor, :null => false
      t.integer :cartorio_id, :null => false

      t.timestamps
    end
    add_index :faturas, :cartorio_id  
  end

  def self.down
    drop_table :faturas
  end
end

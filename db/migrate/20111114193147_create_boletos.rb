class CreateBoletos < ActiveRecord::Migration
  def self.up
    create_table :boletos do |t|
      t.integer :fatura_id, :null => false
      t.date :vencimento, :null => false
      t.float :valor, :null => false
      t.integer :status, :null => false

      t.timestamps
    end
    add_index :boletos, :fatura_id
    add_index :boletos, :vencimento
  end

  def self.down
    drop_table :boletos
  end
end

class CreateSubDepositarios < ActiveRecord::Migration
  def self.up
    create_table :sub_depositarios do |t|
      t.integer :depositario_id, :null => false
      t.string :descricao, :null => false
      t.integer :status
      t.timestamps
    end

    add_index :sub_depositarios, :depositario_id
  end

  def self.down
    drop_table :sub_depositarios
  end
end

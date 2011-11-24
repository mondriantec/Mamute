class CreatePagamentos < ActiveRecord::Migration
  def self.up
    create_table :pagamentos do |t|
      t.integer :boleto_id, :null => false
      t.date :data, :null => false
      t.float :valor, :null => false

      t.timestamps
    end
  add_index :pagamentos, :boleto_id
  execute "ALTER TABLE pagamentos ADD CONSTRAINT fk_pag_bol FOREIGN KEY (boleto_id) REFERENCES boletos (id)
           ON UPDATE RESTRICT ON DELETE RESTRICT;"
  end

  def self.down
    drop_table :pagamentos
  end
end

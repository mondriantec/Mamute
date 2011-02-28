class CreatePrecos < ActiveRecord::Migration
  def self.up
    create_table :precos do |t|
      t.integer :tribunal_id
      t.float :certidao
      t.float :notificacao
      t.float :registro

      t.timestamps
    end
  end

  def self.down
    drop_table :precos
  end
end

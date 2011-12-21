class CreateModelosDeNotificacao < ActiveRecord::Migration
  def self.up
    create_table :modelos_de_notificacao do |t|
      t.string :descricao, :null => false
      t.text :texto
      t.timestamps
    end
     add_index :modelos_de_notificacao, :descricao, :unique => true
  end

  def self.down
    drop_table :modelos_de_notificacao
  end
end

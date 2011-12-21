class CreateTiposDeNotificacao < ActiveRecord::Migration
  def self.up
    create_table :tipos_de_notificacao do |t|
      t.string :descricao, :null => false
      t.integer :modelo_de_notificacao_id, :null => false
      t.timestamps
    end
    add_index :tipos_de_notificacao, :modelo_de_notificacao_id
  end

  def self.down
    drop_table :tipos_de_notificacao
  end
end

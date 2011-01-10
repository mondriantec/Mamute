class CreateNotificacoes < ActiveRecord::Migration
  def self.up
    create_table :notificacoes do |t|
      t.integer :notificado_id
      t.integer :notificado_version_id
      t.integer :cartorio_id
      t.integer :motivo_notificacao_id
      t.integer :descricao
      t.string :status, :limit => 1
      t.timestamps
    end
    add_index :notificacoes, :notificado_id
    add_index :notificacoes, :notificado_version_id
    add_index :notificacoes, :cartorio_id
    add_index :notificacoes, :motivo_notificacao_id
    add_index :notificacoes, :status
    
  end

  def self.down
    drop_table :notificacoes
  end
end

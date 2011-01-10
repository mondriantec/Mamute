class CreateMensagens < ActiveRecord::Migration
  def self.up
    create_table :mensagens do |t|
      t.integer :usuario_id
      t.integer :destinatario_id
      t.string :assunto
      t.text :texto
      t.string :status

      t.timestamps
    end
    add_index :mensagens, :usuario_id
    add_index :mensagens, :destinatario_id
    add_index :mensagens, :assunto
    add_index :mensagens, :status
  end

  def self.down
    drop_table :mensagens
  end
end

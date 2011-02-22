class CreateNoticacaos < ActiveRecord::Migration
  def self.up
    create_table :noticacaos do |t|
      t.integer :cartorio_id
      t.integer :notificado_id
      t.integer :motivo_notificacao_id
      t.text :texto
      t.datetime :data_envio_usuario
      t.integer :status
      t.text :motivo_status

      t.timestamps
    end
  end

  def self.down
    drop_table :noticacaos
  end
end

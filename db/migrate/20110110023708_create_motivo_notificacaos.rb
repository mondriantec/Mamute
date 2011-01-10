class CreateMotivoNotificacaos < ActiveRecord::Migration
  def self.up
    create_table :motivo_notificacaos do |t|
      t.string :motivo
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :motivo_notificacaos
  end
end

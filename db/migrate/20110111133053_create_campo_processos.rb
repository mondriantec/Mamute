class CreateCampoProcessos < ActiveRecord::Migration
  def self.up
    create_table :campo_processos do |t|
      t.integer :tipo_campo_id
      t.integer :tipo_processo_id
      t.string :nome
      t.integer :tamanho

      t.timestamps
    end
  end

  def self.down
    drop_table :campo_processos
  end
end

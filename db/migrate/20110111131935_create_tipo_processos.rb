class CreateTipoProcessos < ActiveRecord::Migration
  def self.up
    create_table :tipo_processos do |t|
      t.string :tipo
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_processos
  end
end

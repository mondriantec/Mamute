class CreateValorCampoProcessos < ActiveRecord::Migration
  def self.up
    create_table :valor_campo_processos do |t|
      t.integer :processo_id
      t.integer :campo_processo_id
      t.text :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :valor_campo_processos
  end
end

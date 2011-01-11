class CreateProcessos < ActiveRecord::Migration
  def self.up
    create_table :processos do |t|
      t.integer :tipo_processo_id

      t.timestamps
    end
    Processo.create_versioned_table
  end

  def self.down
    Processo.drop_versioned_table
    drop_table :processos
    
  end
end

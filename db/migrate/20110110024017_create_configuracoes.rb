class CreateConfiguracoes < ActiveRecord::Migration
  def self.up
    create_table :configuracoes do |t|
      t.string :chave
      t.string :valor
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :configuracoes
  end
end

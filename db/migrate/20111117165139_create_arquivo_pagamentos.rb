class CreateArquivoPagamentos < ActiveRecord::Migration
  def self.up
    create_table :arquivo_pagamentos do |t|
      t.string :nome
      t.text :desricao
      t.string :arquivo_file_name
      t.string :arquivo_content_type
      t.integer :arquivo_file_size
      t.datetime :arquivo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :arquivo_pagamentos
  end
end

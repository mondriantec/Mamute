class RenameDescricaoArquivoPagamentos < ActiveRecord::Migration
  def self.up
    rename_column :arquivo_pagamentos, :desricao, :descricao
  end

  def self.down
    rename_column :arquivo_pagamentos, :descricao, :desricao
  end
end

class AddNumeroPaginasToDocumentos < ActiveRecord::Migration
  def self.up
    add_column :documentos, :numero_paginas, :integer, :default => 0
  end

  def self.down
    remove_column :documentos, :numero_paginas
  end
end

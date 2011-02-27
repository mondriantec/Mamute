class CorrigeLote < ActiveRecord::Migration
  def self.up    
    rename_column :lotes, :selo_incial, :selo_inicial
  end

  def self.down                                      
    rename_column :lotes, :selo_inicial, :selo_incial
  end
end

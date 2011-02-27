class AdicionaDocumentoSelo < ActiveRecord::Migration
  def self.up   
    add_column :documentos, :selo_id, :integer   
    add_column :documentos, :cartorio_id, :integer 
    add_index :documentos, :selo_id
    add_index :documentos, :cartorio_id
  end

  def self.down   
    remove_column :documentos, :selo_id            
    remove_column :documentos, :cartorio_id  
  end
end

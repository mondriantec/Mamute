class AdicionaUsuarioADocumento < ActiveRecord::Migration
  def self.up   
    add_column :documentos, :usuario_id, :integer
    add_index  :documentos, :usuario_id    
  end

  def self.down 
    remove_column :documentos, :usuario_id
  end
end

class AdicionaImagemDocumento < ActiveRecord::Migration
  def self.up
    add_column :documentos, :imagem_content_type, :string
    add_column :documentos, :imagem_file_name, :string
    add_column :documentos, :imagem_file_size, :integer
  end

  def self.down
    remove_column :documentos, :imagem_content_type
    remove_column :documentos, :imagem_file_name
    remove_column :documentos, :imagem_file_size
  end
end

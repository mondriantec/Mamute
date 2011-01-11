class CreateImagemProcessos < ActiveRecord::Migration
  def self.up
    create_table :imagem_processos do |t|
      t.integer :processo_id
      t.string :imagem_file_name
      t.string :imagem_content_type
      t.integer :imagem_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :imagem_processos
  end
end

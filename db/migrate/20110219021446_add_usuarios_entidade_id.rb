class AddUsuariosEntidadeId < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :entidade_type, :string
    add_column :usuarios, :entidade_id, :integer
    add_index :usuarios, [:entidade_type, :entidade_id]
  end

  def self.down
    remove_column :usuarios, :entidade_type
    remove_column :usuarios, :entidade_id
  end
end

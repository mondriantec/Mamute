class AddUsuarioOrganizacao < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :organizacao_id, :integer
    add_column :usuarios, :organizacao_type, :string
    add_index :usuarios, [:organizacao_type, :organizacao_id]
  end

  def self.down
    remove_column :usuarios, :organizacao_id
    remove_column :usuarios, :organizacao_type
  end
end

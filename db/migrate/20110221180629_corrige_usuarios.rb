class CorrigeUsuarios < ActiveRecord::Migration
  def self.up
    remove_column :usuarios, :organizacao_id
    remove_column :usuarios, :organizacao_type
    add_column :usuarios, :admin, :boolean
    u = Usuario.find_by_login('admin')
    u.admin = true
    u.save
  end

  def self.down
    remove_column :usuarios, :admin
    add_column :usuarios, :organizacao_id, :integer
    add_column :usuarios, :organizacao_type, :string
  end
end

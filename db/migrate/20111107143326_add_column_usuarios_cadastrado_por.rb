class AddColumnUsuariosCadastradoPor < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :cadastrado_por_id, :integer
  end

  def self.down
    remove_column :usuarios, :cadastrado_por_id
  end
end

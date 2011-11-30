class AddServicoIdToParametrosFinanceiros < ActiveRecord::Migration
  def self.up
    add_column :parametros_financeiros, :servico_id, :integer
    add_index :parametros_financeiros, :servico_id
  end

  def self.down
    remove_column :parametros_financeiros, :servico_id
  end
end

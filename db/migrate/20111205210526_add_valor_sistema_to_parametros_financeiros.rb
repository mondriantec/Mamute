class AddValorSistemaToParametrosFinanceiros < ActiveRecord::Migration
  def self.up
    add_column :parametros_financeiros, :valor_sistema, :float
  end

  def self.down
    remove_column :parametros_financeiros, :valor_sistema
  end
end

class AddEntidadeIdToPlanosDeConta < ActiveRecord::Migration
  def self.up
    add_column :planos_de_conta, :entidade_id, :integer
  end

  def self.down
    remove_column :planos_de_conta, :entidade_id
  end
end

class AddPlanoDeContaIdToMovimentos < ActiveRecord::Migration
  def self.up
    add_column :movimentos, :plano_de_conta_id, :integer
  end

  def self.down
    remove_column :movimentos, :plano_de_conta_id
  end
end

class AlterarTipoDadosTabelaNotificacoesCidadeId < ActiveRecord::Migration
  def self.up
	remove_column :notificacoes, :cidade_id
	add_column :notificacoes, :cidade_id, :integer
  end


  def self.down
	add_column :notificacoes, :cidade_id, :string
	remove_column :notificacoes, :cidade_id
  end
end

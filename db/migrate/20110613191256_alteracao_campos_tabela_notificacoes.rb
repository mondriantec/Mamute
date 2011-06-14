class AlteracaoCamposTabelaNotificacoes < ActiveRecord::Migration
  def self.up
	rename_column :notificacoes, :cidade, :cidade_id
	
  end

  def self.down
	
	rename_column :notificacoes,  :cidade_id, :cidade
  end
end

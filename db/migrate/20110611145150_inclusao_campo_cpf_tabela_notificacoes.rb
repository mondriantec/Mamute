class InclusaoCampoCpfTabelaNotificacoes < ActiveRecord::Migration
  def self.up
	add_column :notificacoes, :cpf, :string
  end

  def self.down
	add_column :notificacoes, :cpf
  end
end

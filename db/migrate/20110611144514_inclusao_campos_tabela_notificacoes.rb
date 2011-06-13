class InclusaoCamposTabelaNotificacoes < ActiveRecord::Migration
  def self.up
	add_column :notificacoes, :endereco, :string
	add_column :notificacoes, :bairro, :string
	add_column :notificacoes, :cidade, :string
	add_column :notificacoes, :uf, :string
  end

  def self.down
	remove_column :notificacoes, :endereco
	remove_column :notificacoes, :bairro
	remove_column :notificacoes, :cidade
	remove_column :notificacoes, :uf
  end
  
end

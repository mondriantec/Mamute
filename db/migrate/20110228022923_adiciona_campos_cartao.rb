class AdicionaCamposCartao < ActiveRecord::Migration
  def self.up 
    add_column :certidoes, :tipo_cartao, :string
    add_column :certidoes, :numero_cartao, :string
    add_column :certidoes, :mes_validade_cartao, :string
    add_column :certidoes, :ano_validade_cartao, :string 
  end

  def self.down                                         
    remove_column :certidoes, :tipo_cartao
    remove_column :certidoes, :numero_cartao
    remove_column :certidoes, :mes_validade_cartao
    remove_column :certidoes, :ano_validade_cartao
  end
end

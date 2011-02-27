class AdicionaCamposUsuarios < ActiveRecord::Migration
  def self.up 
    add_column :usuarios, :cpf, :string
    add_column :usuarios, :cnpj, :string
    add_column  :usuarios,:rg, :string
    add_column :usuarios, :orgao_rg, :string
    add_column :usuarios, :mae, :string
    add_column :usuarios, :pai, :string
    add_column :usuarios, :data_nascimento, :date
    add_column :usuarios, :naturalidade, :string
    add_column :usuarios, :nacionalidade, :string
    add_column :usuarios, :endereco, :string
    add_column :usuarios, :bairro, :string
    add_column :usuarios, :cep, :string
    add_column :usuarios, :endereco_numero, :string
    add_column :usuarios, :cidade_id, :integer
  end

  def self.down                               
    remove_column :usuarios, :cpf
    remove_column :usuarios, :rg
    remove_column :usuarios, :orgao_rg
    remove_column :usuarios, :mae
    remove_column :usuarios, :pai
    remove_column :usuarios, :data_nascimento
    remove_column :usuarios, :naturalidade
    remove_column :usuarios, :nacionalidade
    remove_column :usuarios, :endereco
    remove_column :usuarios, :bairro
    remove_column :usuarios, :cep
    remove_column :usuarios, :endereco_numero
    remove_column :usuarios, :cidade_id 
  end
end

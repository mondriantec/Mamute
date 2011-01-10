class CreatePessoas < ActiveRecord::Migration
  def self.up
    create_table :pessoas do |t|
      t.string :nome
      t.string :cpf
      t.string :rg
      t.string :orgao_emissor_rg
      t.string :uf_emissor_rg
      t.string :cnh
      t.string :nome_mae
      t.string :endereco
      t.string :bairro
      t.string :cidade_id
      t.string :cep
      t.string :estado_civil
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :pessoas
  end
end

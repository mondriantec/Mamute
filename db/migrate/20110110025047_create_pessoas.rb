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
    add_index :pessoas, :cpf
    add_index :pessoas, :rg
    add_index :pessoas, :cnh
    add_index :pessoas, :nome
    add_index :pessoas, :nome_mae    
    add_index :pessoas, :cidade_id
    
  end

  def self.down
    drop_table :pessoas
  end
end

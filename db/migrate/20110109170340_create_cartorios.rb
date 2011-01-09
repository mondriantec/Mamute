class CreateCartorios < ActiveRecord::Migration
  def self.up
    create_table :cartorios do |t|
      t.integer :cidade_id
      t.string :oficio
      t.string :tabeliao
      t.string :endereco
      t.string :bairro
      t.string :fone
      t.string :fax

      t.timestamps
    end
  end

  def self.down
    drop_table :cartorios
  end
end

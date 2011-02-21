class CreateTribunais < ActiveRecord::Migration
  def self.up
    create_table :tribunais do |t|
      t.string :uf
      t.string :nome
      t.string :presidente

      t.timestamps
    end
  end

  def self.down
    drop_table :tribunais
  end
end

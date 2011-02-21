class CreateIrtds < ActiveRecord::Migration
  def self.up
    create_table :irtds do |t|
      t.string :uf
      t.string :nome
      t.string :presidente
      t.boolean :nacional
      t.timestamps
    end
    Irtd.create(:nome => 'IRTDPJ-BR', :nacional => true)
  end

  def self.down
    drop_table :irtds
  end
end

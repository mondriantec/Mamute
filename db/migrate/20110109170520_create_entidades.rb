class CreateEntidades < ActiveRecord::Migration
  def self.up
    create_table :entidades do |t|
      t.string :nome
      t.string :cnpj

      t.timestamps
    end
    e = Entidade.create(:nome => 'Fabrica Info')
    u = Usuario.find_by_login('admin')
    u.organizacao = e
    u.save
  end

  def self.down
    drop_table :entidades
  end
end

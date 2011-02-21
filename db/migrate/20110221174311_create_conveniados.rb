class CreateConveniados < ActiveRecord::Migration
  def self.up
    create_table :conveniados do |t|
      t.string :cnpj
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :conveniados
  end
end

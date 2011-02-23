class CreateLotes < ActiveRecord::Migration
  def self.up
    create_table :lotes do |t|
      t.integer :tribunal_id
      t.string :selo_prefixo
      t.integer :selo_incial
      t.integer :selo_final

      t.timestamps
    end
  end

  def self.down
    drop_table :lotes
  end
end

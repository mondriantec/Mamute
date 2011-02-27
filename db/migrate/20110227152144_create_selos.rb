class CreateSelos < ActiveRecord::Migration
  def self.up
    create_table :selos do |t|  
      t.string :numero
      t.integer :lote_id
      t.integer :status
      t.timestamps
    end
  end

  def self.down
    drop_table :selos
  end
end

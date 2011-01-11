class CreateTipoCampos < ActiveRecord::Migration
  def self.up
    create_table :tipo_campos do |t|
      t.string :tipo

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_campos
  end
end

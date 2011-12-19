class CreateRepassesFabrica < ActiveRecord::Migration
  def self.up
    create_table :repasses_fabrica do |t|
      t.date :data, :null => false
      t.float :valor, :null => false
      t.text :observacao

      t.timestamps
    end
  end

  def self.down
    drop_table :repasses_fabrica
  end
end

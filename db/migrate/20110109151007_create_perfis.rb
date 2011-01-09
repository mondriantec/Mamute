class CreatePerfis < ActiveRecord::Migration
  def self.up
    create_table :perfis do |t|
      t.string :nome
      t.integer :created_by
      t.integer :updated_by
      t.timestamps
    end
    Perfil.create(:nome => 'ADMIN', :created_by => 1, :updated_by => 1)
  end

  def self.down
    drop_table :perfis
  end
end

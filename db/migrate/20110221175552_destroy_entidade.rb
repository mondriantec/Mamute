class DestroyEntidade < ActiveRecord::Migration
  def self.up
    drop_table :entidades
  end

  def self.down
    puts 'Irreversivel'
  end
end

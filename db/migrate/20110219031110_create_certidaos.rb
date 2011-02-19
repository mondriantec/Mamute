class CreateCertidaos < ActiveRecord::Migration
  def self.up
    create_table :certidaos do |t|
      t.integer :documento_id
      t.integer :numero

      t.timestamps
    end
  end

  def self.down
    drop_table :certidaos
  end
end

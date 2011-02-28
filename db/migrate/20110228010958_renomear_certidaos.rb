class RenomearCertidaos < ActiveRecord::Migration
  def self.up   
    rename_table :certidaos, :certidoes
  end

  def self.down                        
    rename_table :certidoes, :certidaos
  end
end

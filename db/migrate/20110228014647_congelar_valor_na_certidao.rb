class CongelarValorNaCertidao < ActiveRecord::Migration
  def self.up         
    add_column :certidoes, :valor_emolumentos, :float
    add_column :certidoes, :valor_sistema, :float
    add_column :certidoes, :valor_irtd_br, :float
    add_column :certidoes, :valor_irtd, :float
  end

  def self.down      
    remove_column :certidoes, :valor_emolumentos
    remove_column :certidoes, :valor_sistema
    remove_column :certidoes, :valor_irtd_br
    remove_column :certidoes, :valor_irtd   
  end
end

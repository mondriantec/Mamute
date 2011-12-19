class AddValorCobradoToCertidoes < ActiveRecord::Migration
  def self.up
    add_column :certidoes, :valor_cobrado, :float, :default => 0
  end

  def self.down
    remove_column :certidoes, :valor_cobrado
  end
end

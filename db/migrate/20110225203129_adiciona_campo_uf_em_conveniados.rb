class AdicionaCampoUfEmConveniados < ActiveRecord::Migration
  def self.up
      add_column :conveniados, :uf, :string
  end

  def self.down
      add_column :conveniados, :uf
  end
end

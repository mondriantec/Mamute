class AdicionaVersoes < ActiveRecord::Migration
  def self.up
    Pessoa.create_versioned_table
  end

  def self.down
    Pessoa.drop_versioned_table
  end
end

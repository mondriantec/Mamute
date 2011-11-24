class AddFkFatBol < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE boletos ADD CONSTRAINT fk_bol_fat FOREIGN KEY (fatura_id) REFERENCES faturas (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
"
  end

  def self.down
     execute "ALTER TABLE boletos DROP CONSTRAINT fk_bol_fat;"
  end
end

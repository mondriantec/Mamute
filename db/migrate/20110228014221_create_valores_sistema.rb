class CreateValoresSistema < ActiveRecord::Migration
  def self.up
    create_table :valores_sistema do |t|
      t.float :certidao
      t.float :notificacao
      t.float :registro

      t.timestamps
    end     
    ValorSistema.create(:certidao => 1, :notificacao => 7, :registro => 7)
  end

  def self.down
    drop_table :valores_sistema
  end
end

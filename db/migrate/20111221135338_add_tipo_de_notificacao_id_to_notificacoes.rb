class AddTipoDeNotificacaoIdToNotificacoes < ActiveRecord::Migration
  def self.up
    add_column :notificacoes, :tipo_de_notificacao_id, :integer
    add_index :notificacoes, :tipo_de_notificacao_id
  end

  def self.down
    remove_column :notificacoes, :tipo_de_notificacao_id
  end
end

class CreateFksModeloNotificacao < ActiveRecord::Migration
  def self.up
    execute "
             ALTER TABLE notificacoes ADD CONSTRAINT fk_tipo_de_notificacao FOREIGN KEY (tipo_de_notificacao_id) REFERENCES tipos_de_notificacao (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
             ALTER TABLE tipos_de_notificacao ADD CONSTRAINT fk_modelo_de_notificacao FOREIGN KEY (modelo_de_notificacao_id) REFERENCES modelos_de_notificacao (id) ON UPDATE RESTRICT ON DELETE RESTRICT;
            "
  end

  def self.down
    execute "ALTER TABLE tipos_de_notificacao DROP CONSTRAINT fk_modelo_de_notificacao;
             ALTER TABLE notificacoes DROP CONSTRAINT fk_tipo_de_notificacao;
            "
  end
end

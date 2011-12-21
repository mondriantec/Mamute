class TipoDeNotificacao < ActiveRecord::Base
  belongs_to :modelo_de_notificacao
  has_many :notificacoes
  validates_presence_of :descricao, :modelo_de_notificacao_id, :message => ' e obrigatorio.'
end

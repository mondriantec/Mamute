class ModeloDeNotificacao < ActiveRecord::Base
  has_many :tipos_de_notificacao
  validates_presence_of :descricao, :message => ' e obrigatorio.'
  validates_uniqueness_of :descricao, :message => 'ja existe um modelo com essa descricao.'
end

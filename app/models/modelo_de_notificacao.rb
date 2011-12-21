class ModeloDeNotificacao < ActiveRecord::Base
  validates_presence_of :descricao, :message => ' e obrigatorio.'
  validates_uniqueness_of :descricao, :message => 'ja existe um modelo com essa descricao.'
end

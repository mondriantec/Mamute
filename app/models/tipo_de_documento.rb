class TipoDeDocumento < ActiveRecord::Base
  validates_presence_of :descricao, :message => 'é obrigatório'
end

class Servico < ActiveRecord::Base
   validates_presence_of :descricao, :usuario_id, :message => 'é obrigatório.'
end

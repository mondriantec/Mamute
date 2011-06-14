class Cidade < ActiveRecord::Base
  has_many :cartorios	
  has_many :notificacoes
end

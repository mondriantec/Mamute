class Notificacao < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :motivo_notificacao	
end

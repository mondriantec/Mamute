class Notificacao < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :motivo_notificacao	
  belongs_to :notificado, :class_name => 'Usuario', :foreign_key => 'notificado_id'
end

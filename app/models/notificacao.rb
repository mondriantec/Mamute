class Notificacao < ActiveRecord::Base
  belongs_to :cidade
  belongs_to :motivo_notificacao	
  belongs_to :tipo_de_notificacao
  belongs_to :notificado, :class_name => 'Usuario', :foreign_key => 'notificado_id'
  belongs_to :cartorio

  before_save :setar_cartorio

  private
  def setar_cartorio
    self.cartorio = Cartorio.first
  end
end

class Desconto < ActiveRecord::Base
  belongs_to :cartorio
  #belongs_to :item_repasse
  #belongs_to :depositario
  #belongs_to :sub_depositario

  validates_presence_of :cartorio_id, :valor, :status, :motivo, :usuario_id, :depositario_id, :message => 'é obrigatório.'

  def descricao_status
    case self.status
      when 0: 'Pendente'
      when 1: 'Utilizada'
      when 2: 'Paga'
      else 'Não informado/Indefinido'
    end
  end
end

class Boleto < ActiveRecord::Base
  belongs_to :fatura
  has_many :pagamentos

  def descricao_status
    case self.status 
     when 0: 'Gerado'
     when 1: 'Pago Menor'
     when 2: 'Pago Ok'
    end
  end
end

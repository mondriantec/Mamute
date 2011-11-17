class Fatura < ActiveRecord::Base
  has_many :documentos
  belongs_to :cartorio
  has_one :boleto


  def descricao_status
    case self.status 
     when 0: 'Gerada'
     when 1: 'Boleto Pago Menor'
     when 2: 'Boleto Pago Ok'
    end
  end

  def self.descartar_fatura_pendente(uf)
     #apagar os boletos, as faturas e desmarcar os documentos 
  end
end



class Fatura < ActiveRecord::Base
  has_many :documentos
  belongs_to :cartorio
  has_one :boleto


  def self.descartar_fatura_pendente(uf)
     #apagar os boletos, as faturas e desmarcar os documentos 
  end
end



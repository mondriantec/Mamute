class CampoDocumento < ActiveRecord::Base
  belongs_to :tipo_documento
  has_many :campo_documentos

  def valor_campo(documento)
   x = ValorCampoDocumento.find_by_documento_id_and_campo_documento_id documento.id, self.id
   x ? x.valor : ''
  end  
end

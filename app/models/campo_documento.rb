class CampoDocumento < ActiveRecord::Base
  belongs_to :tipo_documento
  belongs_to :tipo_campo
  has_many :campo_documentos
end

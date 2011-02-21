class CampoDocumento < ActiveRecord::Base
  belongs_to :tipo_documento
  has_many :campo_documentos
end

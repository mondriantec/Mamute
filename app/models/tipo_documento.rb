class TipoDocumento < ActiveRecord::Base
  has_many :documentos
  has_many :campo_documentos
end

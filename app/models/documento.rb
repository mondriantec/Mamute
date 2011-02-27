class Documento < ActiveRecord::Base
  has_many :valor_campo_documentos
  belongs_to :tipo_documento
  has_attached_file :imagem    
   belongs_to :usuario
   
  def pode_visualizar?
     false
  end
end

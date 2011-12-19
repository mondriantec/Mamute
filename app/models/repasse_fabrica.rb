class RepasseFabrica < ActiveRecord::Base
   has_many :documentos


   def quantidade_de_documentos
      self.documentos.size
   end

   def quantidade_de_paginas
    self.documentos.sum(:numero_paginas)
   end
end

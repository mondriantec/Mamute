class SubDepositario < ActiveRecord::Base
   belongs_to :depositario

   def descricao_status
     case self.status
       when 0: 'Inativo'
       when 1: 'Ativo'
       else 'Status Indefinido'
     end
   
   end

end


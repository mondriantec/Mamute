class Selo < ActiveRecord::Base   
  belongs_to :lote           
  
  def descricao_status
     "Nao Utilizado"
  end
end

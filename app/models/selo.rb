class Selo < ActiveRecord::Base   
  belongs_to :lote    
  has_one :documento       
  
  def descricao_status
     "Nao Utilizado"
  end
end

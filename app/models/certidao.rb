class Certidao < ActiveRecord::Base
  belongs_to :documento  
  def valor
      self.valor_emolumentos + self.valor_sistema
  end
end

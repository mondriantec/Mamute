class Movimento < ActiveRecord::Base
 belongs_to :depositario
 belongs_to :sub_depositario
 belongs_to :tipo_de_movimento
 belongs_to :usuario


  def pago?
    self.data_pagamento ? true : false 
  end

end

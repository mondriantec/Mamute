class Certidao < ActiveRecord::Base
  belongs_to :documento  
  def valor
      self.valor_emolumentos + self.valor_sistema
  end

  def cacular_valor_cobrado!
    # usar a parametros financeiros para calcular o valor cobrado
    con = ActiveRecord::Base.connection
    sql = "select fnc_gera_valor_cobrado(#{self.documento.tipo_documento_id}, #{self.documento.numero_paginas}, #{self.documento.cartorio.irtd_id}, 2) as resultado "
    res = con.execute sql
    res = res.to_a[0]['resultado'].to_f
    if res == -1 then
     return false
    else
      self.valor_cobrado = res
      self.save
      return true
    end
  end
end

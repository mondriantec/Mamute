class Lote < ActiveRecord::Base    
  has_many :selos
  after_create :criar_selos
  
  def criar_selos
     for i in selo_inicial..selo_final
        s = Selo.new
        s.numero = "#{self.selo_prefixo}#{i}"
        s.status = 0  
        s.lote = self
        s.save
     end
  end
end

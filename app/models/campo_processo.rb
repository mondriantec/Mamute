class CampoProcesso < ActiveRecord::Base
  belongs_to :tipo_processo
  has_many :valor_campo_processos
end

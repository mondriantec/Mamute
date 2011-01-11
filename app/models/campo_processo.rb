class CampoProcesso < ActiveRecord::Base
  belongs_to :tipo_processo
  belongs_to :tipo_campo
  has_many :valor_campo_processos
end

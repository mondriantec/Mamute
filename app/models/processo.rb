class Processo < ActiveRecord::Base
  belongs_to :tipo_processo
  has_many :valor_campo_processos
  acts_as_versioned
end

class TipoProcesso < ActiveRecord::Base
  has_many :processos
  has_many :campo_processos
end

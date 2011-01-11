class ValorCampoProcesso < ActiveRecord::Base
  belongs_to :processo
  belongs_to :campo_processo
end

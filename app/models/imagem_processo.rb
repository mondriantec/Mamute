class ImagemProcesso < ActiveRecord::Base
  belongs_to :processo
  has_attached_file :imagem
end

class Tribunal < ActiveRecord::Base
  has_many :usuarios, :as => :entidade
end

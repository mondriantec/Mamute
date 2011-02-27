class Tribunal < ActiveRecord::Base
  has_many :usuarios, :as => :entidade   
  has_many :lotes
end

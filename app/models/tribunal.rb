class Tribunal < ActiveRecord::Base
  has_many :usuarios, :as => :entidade   
  has_many :lotes
  has_many :cartorios
  has_many :precos
end

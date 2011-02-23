class Cartorio < ActiveRecord::Base
  belongs_to :cidade
  has_many :usuarios, :as => :entidade     
  def nome
     self.oficio
  end
end

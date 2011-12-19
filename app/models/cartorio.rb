class Cartorio < ActiveRecord::Base
  belongs_to :cidade           
  belongs_to :tribunal
  belongs_to :irtd
  has_many :usuarios, :as => :entidade     
  def nome
     self.oficio
  end
end

class Cartorio < ActiveRecord::Base
  belongs_to :cidade           
  belongs_to :tribunal
  has_many :usuarios, :as => :entidade     
  def nome
     self.oficio
  end
end

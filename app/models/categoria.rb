class Categoria < ActiveRecord::Base
  belongs_to :categoria, :foreign_key => :parent_id
  has_many :categorias, :foreign_key => :parent_id
end

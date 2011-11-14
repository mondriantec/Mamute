class Fatura < ActiveRecord::Base
  has_many :documentos
  belongs_to :cartorio
  has_many :boletos
end

class Boleto < ActiveRecord::Base
  belongs_to :fatura
  has_many :pagamentos
end

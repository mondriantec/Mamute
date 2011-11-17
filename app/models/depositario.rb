class Depositario < ActiveRecord::Base
  has_many :movimentos
  has_many :pagamento_de_contas
  has_many :sub_depositarios
end

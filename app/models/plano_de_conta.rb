class PlanoDeConta < ActiveRecord::Base
  has_many :movimentos
  belongs_to :conta_mae, :class_name => 'PlanoDeConta', :foreign_key => :parent_id
  validates_presence_of :codigo_conta, :descricao, :tipo, :message => 'é obrigatório'
  validates_uniqueness_of :codigo_conta, :message => "já existe!"


  def descricao_tipo
    self.tipo == 'D' ? 'Débito' : 'Crédito'
  end

  def descricao_lancavel
    self.lancavel ? 'Sim' : 'Não'
  end
end

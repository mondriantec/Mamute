class ParametroFinanceiro < ActiveRecord::Base
  belongs_to :tipo_documento
  belongs_to :servico
  validates_presence_of :tipo_documento_id, :qtd_paginas_inicial, :valor_qtd_inicial, :usuario_id, :entidade_id, :valor_sistema, :message => 'é obrigatório.'
  validates_uniqueness_of :tipo_documento_id, :scope => :entidade_id, :message => 'Já existe um parametro para esse tipo de documento nesta entidade.'

end

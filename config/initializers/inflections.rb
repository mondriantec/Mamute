# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format 
# (all these examples are active by default):
ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
    inflect.irregular 'perfil', 'perfis'
    inflect.irregular 'configuracao','configuracoes'
    inflect.irregular 'notificacao','notificacoes'
    inflect.irregular 'motivo_notificacao','motivo_notificacaos'    
    inflect.irregular 'mensagem','mensagens'
    inflect.irregular 'imagem','imagens'
    inflect.irregular 'tribunal', 'tribunais'   
    inflect.irregular 'certidao','certidoes'
    inflect.irregular 'valor_sistema','valores_sistema'
    inflect.irregular 'plano_de_conta', 'planos_de_conta'
    inflect.irregular 'tipo_de_documento', 'tipos_de_documento'
    inflect.irregular 'parametro_financeiro', 'parametros_financeiros'
#   inflect.uncountable %w( fish sheep )
end

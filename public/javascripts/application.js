// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

jQuery(document).ready(function() {
    
    // Toda vez que houver modifacao no campo de uf é executado a ação que mostra as cidades da uf selecionada 
    jQuery("#select_cidade_uf").change( function() {
        var valor_uf = jQuery(this).val();
        jQuery('#div_municipios').html('Carregando...');
        jQuery.post('get_municipios', { uf: valor_uf }, function(retorno) {
            jQuery('#div_municipios').html(retorno);
        });
    });
    
    // Pega os dados da pessoa, atraves do cpf
    jQuery("#cpf").blur( function() {
        var campo = jQuery(this);
        
        if(jQuery('#cpf_with_nome').attr('id') == null)
            campo.after('<span style="text-transform: uppercase;" id="cpf_with_nome"></span>')
            
        jQuery('#cpf_with_nome').html('');
        jQuery.ajax({
          url: "/usuarios/get_dados_usuario",
          type: "POST",
          data: ({cpf : campo.val()}),
          dataType: "json",
          success: function(retorno) {
              jQuery('#cpf_with_nome').html('&nbsp;'+retorno.usuario.nome);
          }
        }); 

    });
});
# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper  

  def lista_estados
  [
      ['Selecione a UF.', nil],
      ["ACRE", "AC"],
      ["ALAGOAS", "AL"],
      ["AMAPA", "AP"],
      ["AMAZONAS", "AM"],
      ["BAHIA", "BA"],
      ["CEARA", "CE"],
      ["DISTRITO FEDERAL", "DF"],
      ["ESPIRITO SANTO", "ES"],
      ["GOIAS", "GO"],
      ["MARANHAO", "MA"],
      ["MATO GROSSO DO SUL", "MS"],
      ["MATO GROSSO", "MT"],
      ["MINAS GERAIS", "MG"],
      ["PARAIBA", "PB"],
      ["PARANA", "PR"],
      ["PARA", "PA"],
      ["PERNAMBUCO", "PE"],
      ["PIAUI", "PI"],
      ["RIO DE JANEIRO", "RJ"],
      ["RIO GRANDE DO NORTE", "RN"],
      ["RIO GRANDE DO SUL", "RS"],
      ["RONDONIA", "RO"],
      ["RORAIMA", "RR"],
      ["SANTA CATARINA", "SC"],
      ["SAO PAULO", "SP"],
      ["SERGIPE", "SE"],
      ["TOCANTINS", "TO"],
    ]
  end    
  
  def usuario_cartorio?
    current_usuario.entidade and current_usuario.entidade_type == 'Cartorio'
  end     
  
  def usuario_conveniado?
    current_usuario.entidade and current_usuario.entidade_type == 'Conveniado'
  end  
         
  def usuario_tribunal?
    current_usuario.entidade and current_usuario.entidade_type == 'Tribunal'
  end    

  def usuario_irtd?
    current_usuario.entidade and current_usuario.entidade_type == 'Irtd'
  end  
  
  def usuario_irtd_nacional?
    current_usuario.entidade and current_usuario.entidade_type == 'Irtd' and current_usuario.entidade.nacional
  end  
                                                                                                              
  def usuario_admin?
    current_usuario.admin
  end                    
  
  def usuario_final?
     current_usuario.entidade.nil? and !current_usuario.admin
  end
      
  def edit_entidade_path(entidade)
    "/#{entidade.class.to_s.downcase.pluralize}/#{entidade.id}/edit"
  end
  
  def menu_ativo?(nome)
    "active" if session[:menu] == nome
    "active" if controller_name == nome
  end

  def mostra_menu(menu,titulo)
    #TODO: implementar isso
    #if current_usuario.tem_controller?(menu)
      "<div style='float: left; padding-right: 0px;'>
          <a class='#{menu_ativo?(menu)}' href='/#{menu}'> <span> <strong>          #{titulo}        </strong> </span> </a>
      </div>"

    #  "<li class='#{menu_ativo?(menu)}' ><a href='/#{menu}'><span>#{titulo}</span></a></li>"
    #end
  end


 def scaffold_tools
                  if File.exist?("#{RAILS_ROOT}/app/views/menus/_tools_#{self.controller_name}.html.erb")
                    @scaffold_tools = true
                          render :partial => "menus/tools_#{self.controller_name}"
                  else
                    """
   
  
        <form action='/#{self.controller_name}/search_#{self.controller_name.singularize}' method='get' id='search'>
           <fieldset>
                   <legend>Buscar #{self.controller_name.singularize.capitalize}</legend>
   
      		<p>
      		  <input id='#{self.controller_name}' type='text' size='17' name='#{self.controller_name}' class='mondrian_text_box' style='width: 120px' />
                  <input type='submit' value='OK' class='input-submit-02' /><br />
      		  <!--<a href='javascript:toggle('search-options');' class='ico-drop'>Busca Avançada</a>-->
      		</p>



      		<div id='search-options' style='display:none;'>

      			<p>
      				<label><input type='checkbox' name='' checked='checked' /> Option I.</label><br />
      				<label><input type='checkbox' name='' /> Option II.</label><br />
      				<label><input type='checkbox' name='' /> Option III.</label>
      			</p>

      		</div>

      	</fieldset>
      </form>


      <!-- Create a new project -->
      <a href='/#{self.controller_name}/new' >
      <p id='btn-create_broken' style='background:url(/images/botao_add.jpg); text-decoration: none' class='box'>
           <span style='margin-left: 50px; font-size: 13px; color: white; font-weight: bold'>
              Adicionar #{self.controller_name.singularize.capitalize}
           </span>
      </p>
      </a>
	   """
      end
  end
end


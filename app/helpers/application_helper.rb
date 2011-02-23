# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper          
  def edit_entidade_path(entidade)
    "/#{entidade.class.to_s.downcase.pluralize}/#{entidade.id}/edit"
  end
  
  def menu_ativo?(nome)
    "active" if session[:menu] == nome
  end

  def mostra_menu(menu,titulo)
    #TODO: implementar isso
    #if current_usuario.tem_controller?(menu)
      "<li class='#{menu_ativo?(menu)}' ><a href='/#{menu}'><span>#{titulo}</span></a></li>"
    #end
  end

  def scaffold_tools
		if File.exist?("#{RAILS_ROOT}/app/views/menus/_tools_#{self.controller_name}.html.erb")
		  @scaffold_tools = true
			render :partial => "menus/tools_#{self.controller_name}"
		else
		  """


      <form action='#' method='get' id='search'>
      	<fieldset>
      		<legend>Buscar #{self.controller_name.singularize.capitalize}</legend>

      		<p>
      		  <input type='text' size='17' name='' class='mondrian_text_box' style='width: 120px' />&nbsp;<input type='submit' value='OK' class='input-submit-02' /><br />
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
      <p id='btn-create' class='box'><a href='/#{self.controller_name}/new'><span>Adicionar #{self.controller_name.singularize.capitalize}</span></a></p>
		  """
		end
  end
end


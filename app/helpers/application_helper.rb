# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def menu_ativo?(nome)
    "active" if session[:menu] == nome
  end
  
  def mostra_menu(menu,titulo)
    #TODO: implementar isso
    #if current_usuario.tem_controller?(menu) 
      "<li class='#{menu_ativo?(menu)}' ><a href='/#{menu}'>#{titulo}</a></li>"
    #end
  end  
end

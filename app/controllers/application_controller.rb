# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  layout "mondrian"  
  include AuthenticatedSystem
  before_filter :load_ufs
  before_filter :login_required
  
  before_filter do |f|
    f.menu "home"
  end
  def menu(nome_menu)
    session[:menu] = nome_menu
    session[:submenu] = "menus/submenu_" + nome_menu
  end
 
  def load_ufs
    @ufs = [['Selecione a UF.', nil],
            ['Acre','AC'],
            [ 'Alagoas','AL'], 
            [ 'Amapá','AP'], 
            [ 'Amazonas', 'AM'], 
            [ 'Bahia','BA'], 
            [ 'Ceará','CE'],  
            [ 'Distrito Federal','DF'],  
            ['Espírito Santo','ES'],
            ['Goiás','GO'],
            [ 'Maranhão','MA'], 
            ['Mato Grosso','MT'], 
            ['Mato Grosso do Sul','MS'],
            ['Minas Gerais','MG'],
            ['Pará','PA'], 
            ['Paraíba','PB'], 
            ['Paraná','PR'], 
            ['Pernambuco','PE'],
            ['Piauí','PI'],
            ['Rio de Janeiro','RJ'],
            ['Rio Grande do Norte','RN'],
            ['Rio Grande do Sul','RS'],
            ['Rondônia','RO'], 
            ['Roraima','RR'], 
            ['Santa Catarina', 'SC'],
            ['São Paulo','SP'],
            ['Sergipe', 'SE'],  
            ['Tocantins', 'TO']]
    end 
  
	
end

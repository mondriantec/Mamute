# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  layout "mondrian"  
  include AuthenticatedSystem
  before_filter :login_required
  
  before_filter do |f|
    f.menu "home"
  end
  def menu(nome_menu)
    session[:menu] = nome_menu
    session[:submenu] = "menus/submenu_" + nome_menu
  end

end

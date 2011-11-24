class SiteController < ApplicationController

    before_filter :login_required, :except => [:index, :about, :services, :events, :contacts, :noticia_01]
    
    layout "site"  
end

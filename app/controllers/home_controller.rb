class HomeController < ApplicationController
  def index
  end
  
  def testar
    certificate = request.cgi.env_table['SSL_CLIENT_CERT'].gsub(/(\n|-----(BEGIN|END) CERTIFICATE-----)/, '');
    render :text => certificate
  end

end

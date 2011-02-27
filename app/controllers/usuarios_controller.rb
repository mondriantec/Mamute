class UsuariosController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
                          
  def por_cpf
     @usuario = Usuario.find(:first, :conditions => ["entidade_id is null and cpf = ?",params[:cpf]])         
     render :text => @usuario.nome, :layout => false
  end

  def index  
    @usuario = Usuario.new     
    @usuario.entidade = current_usuario.entidade if current_usuario.entidade
    if current_usuario.admin
      @usuarios = Usuario.all
    elsif current_usuario.entidade
      @usuarios = current_usuario.entidade.usuarios
    end
  end
  
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # render new.rhtml
  def new
    @usuario = Usuario.new
  end
 
  def create                                    
    @usuario = Usuario.new(params[:usuario])
    success = @usuario && @usuario.save 
    @usuario.entidade = current_usuario.entidade
    if success && @usuario.errors.empty?
      flash[:notice] = "Usuário Cadastrado com Sucesso!"
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end                                   
  end
end

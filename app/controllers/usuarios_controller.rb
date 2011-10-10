class UsuariosController < ApplicationController

  include AuthenticatedSystem

  def busca_nome
     @usuarios = Usuario.find(:all, :conditions => "entidade_id is null and nome like '%#{params[:nome_cliente]}%'")
     render :layout => false
  end
                          
  def por_cpf
     @usuario = Usuario.find(:first, :conditions => ["entidade_id is null and cpf = ?",params[:cpf]])         

     if @usuario.nil?
        render :text => 'Não Encontrado', :layout => false
     else
        render :text => @usuario.nome, :layout => false
     end
  end

  def index  
    @usuario = Usuario.new
    @usuario.entidade = current_usuario.entidade if current_usuario.entidade
    @usuarios = []
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
    @usuario.cpf = params[:usuario][:cpf]
    success = @usuario && @usuario.save 
    @usuario.entidade = current_usuario.entidade

    if success && @usuario.errors.empty?
      flash[:notice] = "Usuário Cadastrado com Sucesso!"
      redirect_to :action => 'index'
    else
      flash[:error]  = "We couldn't set up that account.  Tente novamente, ou entre em contato com o administrador."
      render :action => 'new'
    end                                   
  end
  
  def get_dados_usuario
    @usuario = Usuario.find_by_cpf(params[:cpf])
    
    render :layout => false
  end
  
end

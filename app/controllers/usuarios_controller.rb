class UsuariosController < ApplicationController

  include AuthenticatedSystem

  def search_usuario
     @usuarios = current_usuario.entidade.usuarios.find(:all, :conditions => "nome like '%#{params[:usuarios]}%'") 
  end
                          
  def por_cpf
     @usuario = Usuario.find(:first, :conditions => ["entidade_id is null and cpf = ?",params[:cpf].gsub('.','').gsub('-','').gsub('/','')])         

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
    @usuario.cpf = params[:usuario][:cpf].gsub('.','').gsub('-','').gsub('/','')

    if @usuario.login.nil?
       @usuario.login          = @usuario.cpf 
       @usuario.cadastrado_por_id = current_usuario.entidade_id
    else
       @usuario.entidade = current_usuario.entidade
    end

    success = @usuario && @usuario.save 

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

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end

  def buscar_clientes
    condition = "cadastrado_por_id = #{current_usuario.entidade_id}"
    
    if !params[:nome].blank? 
       condition += " and UPPER(nome) like '%#{params[:nome].upcase}%'"
    end
    if !params[:cpf].blank? 
       condition += " and cpf like '%#{params[:cpf]}%'"
    end

    @usuarios = Usuario.all(:conditions => condition )
    render :layout => false
  end  
end

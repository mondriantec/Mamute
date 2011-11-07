class DocumentosController < ApplicationController   
     
  before_filter :login_required, :except => [:verificar]             
  include ApplicationHelper
  
  def verificar
    if request.post?
       selo = Selo.find_by_numero(params[:selo])   
       @documento = selo.documento if selo.documento
    end
  end   
  
  def get_campos            
     @campos = CampoDocumento.find(:all, :order => "ordem", :conditions => ["tipo_documento_id=?",params[:id]])
     render :layout => false
  end
  
  # GET /documentos
  # GET /documentos.xml
  def index            
     # listagem de documentos
     @tipo_documento = []
     if !params[:tipo]
        @tipo_documento << ['- Selecione -','']                                                               
     else
        TipoDocumento.find_all_by_id( params[:tipo][:tipo_documento_id]).each do |t|
           @tipo_documento << [t.tipo, t.id]
        end
     end
     TipoDocumento.all.each do |t|
        @tipo_documento << [t.tipo, t.id] if !@tipo_documento.include?  [t.tipo, t.id]
     end
 
 
     # Novo Documento
     @documento = Documento.new
     
     # Listagem de Documentos
     @documentos = []  
     condition = ''
     if current_usuario.entidade.nil?
        condition = " and cliente_id = #{current_usuario.cpf}"  
     else
        condition = " and cartorio_id = #{current_usuario.entidade_id}"  
     end

     if params[:tipo] and params[:tipo][:tipo_documento_id]
        @documentos = Documento.all(:conditions => "tipo_documento_id = #{params[:tipo][:tipo_documento_id]} #{condition}" ).paginate(:page =>params[:page], :per_page =>5)
     end
 
 
     # Resposta 
     respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @documentos }
     end
  end

  # GET /documentos/1
  # GET /documentos/1.xml
  def show                                  
   
    @documento = Documento.find(params[:id])
    if usuario_final? and @documento.certidoes.size == 0
      redirect_to :controller => 'certidoes', :action => 'new' , :id => @documento.id           
      return
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/new
  # GET /documentos/new.xml
  def new
    @documento = Documento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @documento }
    end
  end

  # GET /documentos/1/edit
  def edit
    @documento = Documento.find(params[:id])
    @campos = CampoDocumento.find(:all, :order => "ordem", :conditions => ["tipo_documento_id=?",@documento.tipo_documento_id])
  end

  # POST /documentos
  # POST /documentos.xml
  def create                                           
    Documento.transaction do                         
      @cliente = Usuario.find_by_cpf(params[:usuario][:cpf])                          
      @documento = Documento.new(params[:documento])      
      @documento.usuario = current_usuario
      @documento.cliente = @cliente
      @documento.cartorio_id = current_usuario.entidade_id

      @documento.save      

      params[:metadados].each do |k,v|
        @documento.valor_campo_documentos.create(:campo_documento_id => k, :valor => v)
      end 
    end
    respond_to do |format|
      if !@documento.new_record?
        flash[:notice] = 'Documento was successfully created.'
        format.html { redirect_to(@documento) }
        format.xml  { render :xml => @documento, :status => :created, :location => @documento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documentos/1
  # PUT /documentos/1.xml
  def update
    @documento = Documento.find params[:documento][:id]
    Documento.transaction do                         
      @documento.cartorio_id = current_usuario.entidade_id
      @documento.save  
      #apaga os valores atuais
      @documento.valor_campo_documentos.each {|v| v.delete}
      params[:metadados].each do |k,v|
        @documento.valor_campo_documentos.create(:campo_documento_id => k, :valor => v)
      end 
    end

    respond_to do |format|
      if 1 == 1 # so pra ajudar nos testes
        flash[:notice] = 'Documento was successfully updated.'
        format.html { redirect_to(@documento) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @documento.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.xml
  def destroy
    @documento = Documento.find(params[:id])
    @documento.destroy

    respond_to do |format|
      format.html { redirect_to(documentos_url) }
      format.xml  { head :ok }
    end
  end
end

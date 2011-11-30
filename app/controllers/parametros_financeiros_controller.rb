class ParametrosFinanceirosController < ApplicationController


  
  before_filter :load_tipos_documentos, :except => [:index, :destroy]
  before_filter :load_servicos, :except => [:index, :destroy]
  # GET /parametros_financeiros
  # GET /parametros_financeiros.xml
  def index
    @parametros_financeiros = ParametroFinanceiro.find(:all, :conditions => ["entidade_id = ?", current_usuario.entidade], :order => 'tipo_documento_id')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parametros_financeiros }
    end
  end

  # GET /parametros_financeiros/1
  # GET /parametros_financeiros/1.xml
  def show
    @parametro_financeiro = ParametroFinanceiro.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parametro_financeiro }
    end
  end

  # GET /parametros_financeiros/new
  # GET /parametros_financeiros/new.xml
  def new
    @parametro_financeiro = ParametroFinanceiro.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parametro_financeiro }
    end
  end

  # GET /parametros_financeiros/1/edit
  def edit
    @parametro_financeiro = ParametroFinanceiro.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)
  end

  # POST /parametros_financeiros
  # POST /parametros_financeiros.xml
  def create
    @parametro_financeiro = ParametroFinanceiro.new(params[:parametro_financeiro])
    @parametro_financeiro.usuario_id = current_usuario.id
    @parametro_financeiro.entidade_id = current_usuario.entidade_id

    respond_to do |format|
      if @parametro_financeiro.save
        format.html { redirect_to(@parametro_financeiro, :notice => 'Parametro cadastrado com sucesso.') }
        format.xml  { render :xml => @parametro_financeiro, :status => :created, :location => @parametro_financeiro }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parametro_financeiro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parametros_financeiros/1
  # PUT /parametros_financeiros/1.xml
  def update
    @parametro_financeiro = ParametroFinanceiro.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)

    respond_to do |format|
      if @parametro_financeiro.update_attributes(params[:parametro_financeiro])
        format.html { redirect_to(@parametro_financeiro, :notice => 'Parametro atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parametro_financeiro.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parametros_financeiros/1
  # DELETE /parametros_financeiros/1.xml
  def destroy
    @parametro_financeiro = ParametroFinanceiro.find_by_id_and_entidade_id(params[:id], current_usuario.entidade_id)
    @parametro_financeiro.destroy

    respond_to do |format|
      format.html { redirect_to(parametros_financeiros_url) }
      format.xml  { head :ok }
    end
  end

 def load_tipos_documentos
    @tipos_documentos = [['Selecione um tipo de documento', nil]]
    tipos = TipoDocumento.all(:order => 'tipo')
   tipos.each {|t| @tipos_documentos << [t.tipo, t.id]}
 end

 def load_servicos
   @servicos = [['Selecione um serviço.']]
   servicos = Servico.all(:order => 'descricao')
   servicos.each {|s| @servicos << [s.descricao, s.id]}
 end
end

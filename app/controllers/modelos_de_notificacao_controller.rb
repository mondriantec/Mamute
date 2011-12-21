class ModelosDeNotificacaoController < ApplicationController
  # GET /modelos_de_notificacao
  # GET /modelos_de_notificacao.xml
  def index
    @modelos_de_notificacao = ModeloDeNotificacao.find(:all, :order => 'descricao')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @modelos_de_notificacao }
    end
  end

  # GET /modelos_de_notificacao/1
  # GET /modelos_de_notificacao/1.xml
  def show
    @modelo_de_notificacao = ModeloDeNotificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @modelo_de_notificacao }
    end
  end

  # GET /modelos_de_notificacao/new
  # GET /modelos_de_notificacao/new.xml
  def new
    @modelo_de_notificacao = ModeloDeNotificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @modelo_de_notificacao }
    end
  end

  # GET /modelos_de_notificacao/1/edit
  def edit
    @modelo_de_notificacao = ModeloDeNotificacao.find(params[:id])
  end

  # POST /modelos_de_notificacao
  # POST /modelos_de_notificacao.xml
  def create
    @modelo_de_notificacao = ModeloDeNotificacao.new(params[:modelo_de_notificacao])

    respond_to do |format|
      if @modelo_de_notificacao.save
        format.html { redirect_to(@modelo_de_notificacao, :notice => 'Modelo De Notificacao cadastrado com sucesso.') }
        format.xml  { render :xml => @modelo_de_notificacao, :status => :created, :location => @modelo_de_notificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @modelo_de_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /modelos_de_notificacao/1
  # PUT /modelos_de_notificacao/1.xml
  def update
    @modelo_de_notificacao = ModeloDeNotificacao.find(params[:id])

    respond_to do |format|
      if @modelo_de_notificacao.update_attributes(params[:modelo_de_notificacao])
        format.html { redirect_to(@modelo_de_notificacao, :notice => 'Modelo De Notificacao atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @modelo_de_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos_de_notificacao/1
  # DELETE /modelos_de_notificacao/1.xml
  def destroy
    @modelo_de_notificacao = ModeloDeNotificacao.find(params[:id])
    @modelo_de_notificacao.destroy

    respond_to do |format|
      format.html { redirect_to(modelos_de_notificacao_url) }
      format.xml  { head :ok }
    end
  end
end

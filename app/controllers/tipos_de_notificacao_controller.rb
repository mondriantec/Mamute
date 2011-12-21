class TiposDeNotificacaoController < ApplicationController

  before_filter :load_modelos, :except => ['index, :destroy']
  # GET /tipos_de_notificacao
  # GET /tipos_de_notificacao.xml
  def index
    @tipos_de_notificacao = TipoDeNotificacao.find(:all, :order => 'descricao')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipos_de_notificacao }
    end
  end

  # GET /tipos_de_notificacao/1
  # GET /tipos_de_notificacao/1.xml
  def show
    @tipo_de_notificacao = TipoDeNotificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_de_notificacao }
    end
  end

  # GET /tipos_de_notificacao/new
  # GET /tipos_de_notificacao/new.xml
  def new
    @tipo_de_notificacao = TipoDeNotificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_de_notificacao }
    end
  end

  # GET /tipos_de_notificacao/1/edit
  def edit
    @tipo_de_notificacao = TipoDeNotificacao.find(params[:id])
  end

  # POST /tipos_de_notificacao
  # POST /tipos_de_notificacao.xml
  def create
    @tipo_de_notificacao = TipoDeNotificacao.new(params[:tipo_de_notificacao])

    respond_to do |format|
      if @tipo_de_notificacao.save
        format.html { redirect_to(@tipo_de_notificacao, :notice => 'Tipo De Notificacao cadastrado com sucesso.') }
        format.xml  { render :xml => @tipo_de_notificacao, :status => :created, :location => @tipo_de_notificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_de_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipos_de_notificacao/1
  # PUT /tipos_de_notificacao/1.xml
  def update
    @tipo_de_notificacao = TipoDeNotificacao.find(params[:id])

    respond_to do |format|
      if @tipo_de_notificacao.update_attributes(params[:tipo_de_notificacao])
        format.html { redirect_to(@tipo_de_notificacao, :notice => 'TipoDeNotificacao atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_de_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_notificacao/1
  # DELETE /tipos_de_notificacao/1.xml
  def destroy
    @tipo_de_notificacao = TipoDeNotificacao.find(params[:id])
    @tipo_de_notificacao.destroy

    respond_to do |format|
      format.html { redirect_to(tipos_de_notificacao_url) }
      format.xml  { head :ok }
    end
  end

  def load_modelos
    @modelos = [['Selecione um Modelo de Notificação', nil]]
    mod = ModeloDeNotificacao.find(:all, :order => 'descricao')
    mod.each {|m| @modelos << [m.descricao, m.id]}
  end
end

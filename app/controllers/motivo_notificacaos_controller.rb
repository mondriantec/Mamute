class MotivoNotificacaosController < ApplicationController

  before_filter { |f| f.menu 'administracao' }

  # GET /motivo_notificacaos
  # GET /motivo_notificacaos.xml
  def index
    @motivo_notificacaos = MotivoNotificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @motivo_notificacaos }
    end
  end

  # GET /motivo_notificacaos/1
  # GET /motivo_notificacaos/1.xml
  def show
    @motivo_notificacao = MotivoNotificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @motivo_notificacao }
    end
  end

  # GET /motivo_notificacaos/new
  # GET /motivo_notificacaos/new.xml
  def new
    @motivo_notificacao = MotivoNotificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @motivo_notificacao }
    end
  end

  # GET /motivo_notificacaos/1/edit
  def edit
    @motivo_notificacao = MotivoNotificacao.find(params[:id])
  end

  # POST /motivo_notificacaos
  # POST /motivo_notificacaos.xml
  def create
    @motivo_notificacao = MotivoNotificacao.new(params[:motivo_notificacao])

    respond_to do |format|
      if @motivo_notificacao.save
        flash[:notice] = 'MotivoNotificacao was successfully created.'
        format.html { redirect_to(@motivo_notificacao) }
        format.xml  { render :xml => @motivo_notificacao, :status => :created, :location => @motivo_notificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @motivo_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /motivo_notificacaos/1
  # PUT /motivo_notificacaos/1.xml
  def update
    @motivo_notificacao = MotivoNotificacao.find(params[:id])

    respond_to do |format|
      if @motivo_notificacao.update_attributes(params[:motivo_notificacao])
        flash[:notice] = 'MotivoNotificacao was successfully updated.'
        format.html { redirect_to(@motivo_notificacao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @motivo_notificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /motivo_notificacaos/1
  # DELETE /motivo_notificacaos/1.xml
  def destroy
    @motivo_notificacao = MotivoNotificacao.find(params[:id])
    @motivo_notificacao.destroy

    respond_to do |format|
      format.html { redirect_to(motivo_notificacaos_url) }
      format.xml  { head :ok }
    end
  end
end

class ProcessosController < ApplicationController

  before_filter { |f| f.menu 'processos' }

  # GET /processos
  # GET /processos.xml
  def index
    @processos = Processo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @processos }
    end
  end

  # GET /processos/1
  # GET /processos/1.xml
  def show
    @processo = Processo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @processo }
    end
  end

  # GET /processos/new
  # GET /processos/new.xml
  def new
    @processo = Processo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @processo }
    end
  end

  # GET /processos/1/edit
  def edit
    @processo = Processo.find(params[:id])
  end

  # POST /processos
  # POST /processos.xml
  def create
    @processo = Processo.new(params[:processo])

    respond_to do |format|
      if @processo.save
        flash[:notice] = 'Processo was successfully created.'
        format.html { redirect_to(@processo) }
        format.xml  { render :xml => @processo, :status => :created, :location => @processo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /processos/1
  # PUT /processos/1.xml
  def update
    @processo = Processo.find(params[:id])

    respond_to do |format|
      if @processo.update_attributes(params[:processo])
        flash[:notice] = 'Processo was successfully updated.'
        format.html { redirect_to(@processo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @processo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /processos/1
  # DELETE /processos/1.xml
  def destroy
    @processo = Processo.find(params[:id])
    @processo.destroy

    respond_to do |format|
      format.html { redirect_to(processos_url) }
      format.xml  { head :ok }
    end
  end
end

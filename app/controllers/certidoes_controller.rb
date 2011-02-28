class CertidoesController < ApplicationController
  # GET /certidaos
  # GET /certidaos.xml
  def index
    @certidoes_pendentes = Certidao.all.paginate(:page => params[:page], :per_page => 5)
    @certidoes_emitidas = Certidao.all.paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @certidaos }
    end
  end

  # GET /certidaos/1
  # GET /certidaos/1.xml
  def show
    @certidao = Certidao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @certidao }
    end
  end

  # GET /certidaos/new
  # GET /certidaos/new.xml
  def new
    @certidao = Certidao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @certidao }
    end
  end

  # GET /certidaos/1/edit
  def edit
    @certidao = Certidao.find(params[:id])
  end

  # POST /certidaos
  # POST /certidaos.xml
  def create
    @certidao = Certidao.new(params[:certidao])

    respond_to do |format|
      if @certidao.save
        flash[:notice] = 'Certidao was successfully created.'
        format.html { redirect_to(@certidao) }
        format.xml  { render :xml => @certidao, :status => :created, :location => @certidao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @certidao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /certidaos/1
  # PUT /certidaos/1.xml
  def update
    @certidao = Certidao.find(params[:id])

    respond_to do |format|
      if @certidao.update_attributes(params[:certidao])
        flash[:notice] = 'Certidao was successfully updated.'
        format.html { redirect_to(@certidao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @certidao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /certidaos/1
  # DELETE /certidaos/1.xml
  def destroy
    @certidao = Certidao.find(params[:id])
    @certidao.destroy

    respond_to do |format|
      format.html { redirect_to(certidaos_url) }
      format.xml  { head :ok }
    end
  end
end

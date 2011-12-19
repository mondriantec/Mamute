class RepassesFabricaController < ApplicationController
  # GET /repasses_fabrica
  # GET /repasses_fabrica.xml
  def index
    @repasses_fabrica = RepasseFabrica.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repasses_fabrica }
    end
  end

  # GET /repasses_fabrica/1
  # GET /repasses_fabrica/1.xml
  def show
    @repasse_fabrica = RepasseFabrica.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repasse_fabrica }
    end
  end

  # GET /repasses_fabrica/new
  # GET /repasses_fabrica/new.xml
  def new
    @repasse_fabrica = RepasseFabrica.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repasse_fabrica }
    end
  end

  # GET /repasses_fabrica/1/edit
  def edit
    @repasse_fabrica = RepasseFabrica.find(params[:id])
  end

  # POST /repasses_fabrica
  # POST /repasses_fabrica.xml
  def create
    @repasse_fabrica = RepasseFabrica.new(params[:repasse_fabrica])

    respond_to do |format|
      if @repasse_fabrica.save
        format.html { redirect_to(@repasse_fabrica, :notice => 'RepasseFabrica was successfully created.') }
        format.xml  { render :xml => @repasse_fabrica, :status => :created, :location => @repasse_fabrica }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repasse_fabrica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repasses_fabrica/1
  # PUT /repasses_fabrica/1.xml
  def update
    @repasse_fabrica = RepasseFabrica.find(params[:id])

    respond_to do |format|
      if @repasse_fabrica.update_attributes(params[:repasse_fabrica])
        format.html { redirect_to(@repasse_fabrica, :notice => 'RepasseFabrica was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repasse_fabrica.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /repasses_fabrica/1
  # DELETE /repasses_fabrica/1.xml
  def destroy
    @repasse_fabrica = RepasseFabrica.find(params[:id])
    @repasse_fabrica.destroy

    respond_to do |format|
      format.html { redirect_to(repasses_fabrica_url) }
      format.xml  { head :ok }
    end
  end
end

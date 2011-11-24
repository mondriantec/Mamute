class SubDepositariosController < ApplicationController
  # GET /sub_depositarios
  # GET /sub_depositarios.xml
  def index
    @sub_depositarios = SubDepositario.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sub_depositarios }
    end
  end

  # GET /sub_depositarios/1
  # GET /sub_depositarios/1.xml
  def show
    @sub_depositario = SubDepositario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sub_depositario }
    end
  end

  # GET /sub_depositarios/new
  # GET /sub_depositarios/new.xml
  def new
    @sub_depositario = SubDepositario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sub_depositario }
    end
  end

  # GET /sub_depositarios/1/edit
  def edit
    @sub_depositario = SubDepositario.find(params[:id])
  end

  # POST /sub_depositarios
  # POST /sub_depositarios.xml
  def create
    @sub_depositario = SubDepositario.new(params[:sub_depositario])

    respond_to do |format|
      if @sub_depositario.save
        format.html { redirect_to(@sub_depositario, :notice => 'SubDepositario was successfully created.') }
        format.xml  { render :xml => @sub_depositario, :status => :created, :location => @sub_depositario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sub_depositario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sub_depositarios/1
  # PUT /sub_depositarios/1.xml
  def update
    @sub_depositario = SubDepositario.find(params[:id])

    respond_to do |format|
      if @sub_depositario.update_attributes(params[:sub_depositario])
        format.html { redirect_to(@sub_depositario, :notice => 'SubDepositario was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sub_depositario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_depositarios/1
  # DELETE /sub_depositarios/1.xml
  def destroy
    @sub_depositario = SubDepositario.find(params[:id])
    @sub_depositario.destroy

    respond_to do |format|
      format.html { redirect_to(sub_depositarios_url) }
      format.xml  { head :ok }
    end
  end
end

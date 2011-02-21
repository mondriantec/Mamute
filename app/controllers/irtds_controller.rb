class IrtdsController < ApplicationController
  # GET /irtds
  # GET /irtds.xml
  def index
    @irtds = Irtd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @irtds }
    end
  end

  # GET /irtds/1
  # GET /irtds/1.xml
  def show
    @irtd = Irtd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @irtd }
    end
  end

  # GET /irtds/new
  # GET /irtds/new.xml
  def new
    @irtd = Irtd.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @irtd }
    end
  end

  # GET /irtds/1/edit
  def edit
    @irtd = Irtd.find(params[:id])
  end

  # POST /irtds
  # POST /irtds.xml
  def create
    @irtd = Irtd.new(params[:irtd])

    respond_to do |format|
      if @irtd.save
        flash[:notice] = 'Irtd was successfully created.'
        format.html { redirect_to(@irtd) }
        format.xml  { render :xml => @irtd, :status => :created, :location => @irtd }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @irtd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /irtds/1
  # PUT /irtds/1.xml
  def update
    @irtd = Irtd.find(params[:id])

    respond_to do |format|
      if @irtd.update_attributes(params[:irtd])
        flash[:notice] = 'Irtd was successfully updated.'
        format.html { redirect_to(@irtd) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @irtd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /irtds/1
  # DELETE /irtds/1.xml
  def destroy
    @irtd = Irtd.find(params[:id])
    @irtd.destroy

    respond_to do |format|
      format.html { redirect_to(irtds_url) }
      format.xml  { head :ok }
    end
  end
end

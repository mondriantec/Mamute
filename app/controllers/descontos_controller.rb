class DescontosController < ApplicationController

  before_filter :load_cidades
  # GET /descontosgit 
  # GET /descontos.xml
  def index
	    @status = []
      @status << ["PENDENTE","0"]
      @status << ["UTILIZADA" ,"1"]
      @status << ["PAGA" ,"2"]
      if not request.post?
        if current_usuario.entidade_type == 'Cartorio' 
          @descontos = Desconto.find(:all, :conditions => ['cartorio_id = ?', current_usuario.entidade_id], :order => 'id' )
        else
          @descontos = Desconto.find(:all, :conditions => ['status = 0'], :order => 'id')
        end
      else
        cond = [""]

        if params[:desconto][:status] and !params[:desconto][:status].empty?
          cond[0] += " and " if cond[0].length > 0
          cond[0] += "status = ?"
          cond << params[:desconto][:status]
        end
        if params[:desconto][:cartorio_id] and !params[:desconto][:cartorio_id].empty?
          cond[0] += " and " if cond[0].length > 0
          cond[0] += "cartorio_id = ?"
          cond << params[:desconto][:cartorio_id]
        end
        
        if current_usuario.entidade_type == 'Cartorio'
        cond[0] += " and " if cond[0].length > 0
        cond[0] += "cartorio_id = ?"
        cond << current_usuario.entidade_id.to_s
        end
	      begin 	
  	      @descontos = Desconto.find(:all, :conditions => cond)
        rescue ActiveRecord::RecordNotFound => erro 
          flash[:error] = "Resgistro não encontrado"
          redirect_to :controller => "erros", :action => "index"
        rescue => erro
          flash[:error] = "O correu o seguinte erro: #{erro}"
          redirect_to :controller => "erros", :action => "index"
        end  
     end
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @descontos }
    end
  end

  # GET /descontos/1
  # GET /descontos/1.xml
  def show
    @desconto = Desconto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @desconto }
    end
  end

  # GET /descontos/new
  # GET /descontos/new.xml
  def new
    unless current_usuario.entidade_type == 'Cartorio' 
      flash[:notice] = 'Acesso não permitido'
      redirect_to :action => 'index'
      return
    end
    @desconto = Desconto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @desconto }
    end
  end

  # GET /descontos/1/edit
  def edit
  unless current_usuario.gerente_financeiro_entidade 
      flash[:notice] = 'Acesso não permitido'
      redirect_to :action => 'index'
      return
    end
    @desconto = Desconto.find(params[:id])
  end

  # POST /descontos
  # POST /descontos.xml
  def create
  unless current_usuario.gerente_financeiro_entidade 
      flash[:notice] = 'Acesso não permitido'
      redirect_to :action => 'index'
      return
    end
    @desconto = Desconto.new(params[:desconto])
    @desconto.usuario_id = current_usuario.id
    @desconto.status = 0
    @desconto.entidade_id = current_usuario.entidade_id
    @desconto.valor = params[:desconto][:valor].gsub(',','.').to_f

    respond_to do |format|
      if @desconto.save
        flash[:notice] = 'Desconto cadastrado com sucesso.'
        format.html { redirect_to(@desconto) }
        format.xml  { render :xml => @desconto, :status => :created, :location => @desconto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @desconto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /descontos/1
  # PUT /descontos/1.xml
  def update
  unless current_usuario.gerente_financeiro_entidade 
      flash[:notice] = 'Acesso não permitido'
      redirect_to :action => 'index'
      return
    end
    @desconto = Desconto.find(params[:id])

    respond_to do |format|
      if @desconto.update_attributes(params[:desconto])
        flash[:notice] = 'Desconto atualizado com sucesso.'
        format.html { redirect_to(@desconto) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @desconto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /descontos/1
  # DELETE /descontos/1.xml
  def destroy
    @desconto = Desconto.find(params[:id])
    @desconto.destroy

    respond_to do |format|
      format.html { redirect_to(descontos_url) }
      format.xml  { head :ok }
    end
  end

  def get_cartorios
    cidade = Cidade.find_by_id(params[:desconto_cidade])
    @cartorios = [] 
    cidade.get_cartorios.each {|c| @cartorios << [c.oficio, c.id]}
    if @cartorios.size > 0
       render :layout => false
    else
       render :text => 'Nenhum cartório disponivel.'
    end
      
  end
  
  def load_cidades
    cidades = Cidade.find(:all, :conditions => "UF = 'CE'", :order => 'nome')
    @cidades = []
    @cidades << ['    Selecione o municipio   ',nil]
    cidades.each {|c| @cidades << [c.nome, c.id]}
  end

  def get_sub_depositario
    @sub_depositarios = SubDepositario.find_all_by_depositario_id_and_status(params[:depositario_id],1)
    if @sub_depositarios
       render :layout => false
    else
       render :text => ''
    end
  end

end

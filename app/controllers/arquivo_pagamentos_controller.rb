class ArquivoPagamentosController < ApplicationController
  def index
#	  begin
      @meses = []
      @meses << ["Janeiro"   ,"1"]
      @meses << ["Fevereiro" ,"2"]
      @meses << ["Março"     ,"3"]
      @meses << ["Abril"     ,"4"]
      @meses << ["Maio"      ,"5"]
      @meses << ["Junho"     ,"6"]
      @meses << ["Julho"     ,"7"]
      @meses << ["Agosto"    ,"8"]
      @meses << ["Setembro"  ,"9"]
      @meses << ["Outubro"   ,"10"]
      @meses << ["Novembro"  ,"11"]
      @meses << ["Dezembro"  ,"12"]
      mes = (params[:mes_do_ano] ? params[:mes_do_ano] : Date.today.month)
      @arquivo_pagamentos = ArquivoPagamento.find(:all, :conditions => ["date_part('month', created_at) = ?", mes], :order => 'created_at')
      respond_to do |format|
    		format.html # index.html.erb
	    	format.xml  { render :xml => @arquivo_pagamentos }
	  end  
=begin
    rescue ActiveRecord::RecordNotFound => erro 
      flash[:error] = "Resgistro não encontrado"
      #redirect_to :controller => "erros", :action => "index"
    rescue => erro
      flash[:error] = "O correu o seguinte erro: #{erro}"
      #redirect_to :controller => "erros", :action => "index"
    end     
=end

  end

  def new
    @arquivo_pagamento = ArquivoPagamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @arquivo_pagamento }
    end
  end

  def create
    @arquivo_pagamento = ArquivoPagamento.new(params[:arquivo_pagamento])

    respond_to do |format|
      if @arquivo_pagamento.save
        flash[:notice] = 'Arquivo de Pagamento criado com sucesso.'
        format.html { redirect_to(arquivo_pagamentos_path) }
        format.xml  { render :xml => @arquivo_pagamento, :status => :created, :location => @arquivo_pagamento }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @arquivo_pagamento.errors, :status => :unprocessable_entity }
      end
    end
  end
end

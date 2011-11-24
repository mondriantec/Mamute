class ArquivoPagamento < ActiveRecord::Base
  validates_uniqueness_of :nome, :message => "já existe."
  validate_on_create :processar_arquivo_de_pagamento
	validates_presence_of :arquivo, :message => "não pode ser nulo."

  has_attached_file :arquivo, :path => ":rails_root/public/arquivopagamento/:basename.:extension"

  def processar_arquivo_de_pagamento
    if self.arquivo.path == nil
	    self.errors.add_to_base("Você precisa escolher um arquivo para enviar.")
    else
    	file = File.open("#{self.arquivo.to_file.path}")
      linha_inicial = file.readline.grep(/02RETORNO01COBRANCA/)
    	if linha_inicial.size > 0
      	linhas = file.readlines
        d = linha_inicial[0][94,6]
        data_base = ("20#{d[4,2]}-#{d[2,2]}-#{d[0,2]}").to_date
        if data_base.wday == 5 or data_base.wday == 6
           data_base = data_base.next_week
        else
           data_base = data_base.next 
        end
	      linhas.pop
	      for l in linhas
          numero_documento = l[70,11].to_i
          b = Boleto.find_by_id(numero_documento)
       		p = Pagamento.new
       		p.boleto_id = l[70,11].to_i
          d = l[110,6]
          data = "20"+d[4,2] + "/" + d[2,2] + "/" + d[0,2]
	        p.data = data.to_date + 1.day
	        v = l[253,13].to_i.to_s
	        p.valor = v.to_s.insert(v.length - 2,'.').to_f
          if p.valor > 0
            p.save
          end
     		   self.nome = self.arquivo_file_name
      	end
    	end
  	end
	end
end


class Documento < ActiveRecord::Base
  has_many :valor_campo_documentos
  has_many :certidoes
  belongs_to :tipo_documento
  belongs_to :usuario    
  belongs_to :selo
  belongs_to :cartorio
  belongs_to :cliente, :class_name => 'Usuario', :foreign_key => 'cliente_id'
  
  has_attached_file :imagem
  
  before_save :usar_selo 

  def campo_chave
    self.tipo_documento.campo_documentos.find(:first, :order => "ordem")
  end

  def valor_chave
    self.valor_campo_documentos.find_by_campo_documento_id(self.campo_chave).valor
  end
  
  def valor_certidao
     self.cartorio.tribunal.precos.last.certidao + ValorSistema.first.certidao
  end
   
   def usar_selo              
      s = Selo.find(:first, :order => "id", :conditions => ["status = 0 and lote_id in (?)",self.cartorio.tribunal.lote_ids])
      s.status = 1
      s.save
      self.selo = s
   end
 
  def desenha_selo
  end
                        
  def to_pdf
    if (self.imagem_content_type == 'application/pdf' or self.imagem_content_type == 'application/tiff'  ) 
        return self.imagem.url
    else
        require 'fpdf'

        @documento = self
        @pdf=FPDF.new('P','mm','A4')
        @pdf.AddPage( 'P')
        @pdf.SetDrawColor(155, 155, 155)
        @pdf.SetFillColor(255, 255, 255)
        @pdf.SetTextColor(0, 0, 0)

        @pdf.SetLineWidth(0.1)

        @pdf.SetFont('Arial','B',10)

        # Title                    
                    
#        @pdf.Image("#{RAILS_ROOT}/public/images/brasao2.jpg", 12, 10, 25)   
 
        texto = "                                   
                               #{@documento.selo.lote.tribunal.nome}
                               Selo N.:  #{@documento.selo.numero}
                               #{@documento.cartorio.oficio}
                               Tabeliao:  #{@documento.cartorio.tabeliao}
                               Data: #{@documento.created_at.strftime('%d/%m/%Y')}
                               "
        texto = Iconv.iconv('iso-8859-1','utf-8',texto).join
                        
        @pdf.MultiCell(190,4,texto,1,'L')        
   
        @pdf.Image("#{RAILS_ROOT}/public#{@documento.imagem.url}", 10, 50, 100)
        @pdf.Output("#{RAILS_ROOT}/public/pdfs/#{@documento.id}.pdf")  
        return "/pdfs/#{@documento.id}.pdf"   
    end
  end 
   
  def pode_visualizar?
     false
  end
end

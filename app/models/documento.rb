
class Documento < ActiveRecord::Base
  has_many :valor_campo_documentos
  has_many :certidoes
  belongs_to :tipo_documento
  belongs_to :usuario    
  belongs_to :selo
  belongs_to :cartorio     
  
  has_attached_file :imagem
  
  before_save :usar_selo 
  
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
     # Colors of frame, background and text

  end
                        
   
  def to_pdf
     
    
    require 'fpdf'

    @documento = self

    @pdf=FPDF.new
    @pdf.AddPage
    @pdf.SetDrawColor(0, 0, 0)
    @pdf.SetFillColor(255, 255, 255)
    @pdf.SetTextColor(0, 0, 0)

    @pdf.SetLineWidth(0.1)


    @pdf.SetFont('Arial','B',10)

    # Title                    


    texto = "#{@documento.selo.lote.tribunal.nome}
Selo N.:  #{@documento.selo.numero}
#{@documento.cartorio.oficio}
Tabeliao:  #{@documento.cartorio.tabeliao}
Data: #{@documento.created_at.strftime('%d/%m/%Y')}"
    @pdf.MultiCell(60,5,texto,1,'C')        
    @pdf.Image("#{RAILS_ROOT}/public#{@documento.imagem.url}", 10, 40, 33)
    @pdf.Output("#{RAILS_ROOT}/public/pdfs/#{@documento.id}.pdf")  
    "/pdfs/#{@documento.id}.pdf"
  end 
   
  def pode_visualizar?
     false
  end
end

module CategoriasHelper
  def escrever_categoria(categoria)
    r = "<li>#{link_to(categoria.nome,categoria)}</li>"
    
    r << "<ul>" if categoria.categorias.size > 0
    categoria.categorias.each do |c|
      r << escrever_categoria(c)
    end
    r << "</ul>" if categoria.categorias.size > 0
    r
  end
end

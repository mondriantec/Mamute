class CadastraEntidades < ActiveRecord::Migration
  def self.up

    #Instituto
    irtd = Irtd.new
    irtd.uf = 'CE'
    irtd.nome = 'IRTDPJ-CE'
    irtd.save

    u_irtd = irtd.usuarios.new
    u_irtd.login = u_irtd.nome = 'usuario_irtd'
    u_irtd.password = u_irtd.password_confirmation = '123456'
    u_irtd.email = 'usuario_irtd@uol.com.br'
    u_irtd.save
    

    # Tribunal
    t = Tribunal.new
    t.uf = 'CE'
    t.nome = 'Tribunal de Justiça do Ceará'
    t.save

    u_tribunal = t.usuarios.new
    u_tribunal.login = u_tribunal.nome = 'usuario_tribunal'
    u_tribunal.password = u_tribunal.password_confirmation = '123456'
    u_tribunal.email = 'usuario_tribunal@uol.com.br'
    u_tribunal.save

    # Conveniado
    conveniado = Conveniado.new
    conveniado.nome = 'Tribunal de Contas do Estado do Ceará'
    conveniado.save
        
    u_conveniado = conveniado.usuarios.new
    u_conveniado.login = u_conveniado.nome = 'usuario_conveniado'
    u_conveniado.password = u_conveniado.password_confirmation = '123456'
    u_conveniado.email = 'usuario_conveniado@uol.com.br'
    u_conveniado.save
 
    # Cartorio
    cidade = Cidade.new
    cidade.uf = 'CE'
    cidade.nome = 'Fortaleza'
    cidade.save
    
    cartorio = Cartorio.new
    cartorio.cidade = cidade
    cartorio.oficio = '1o Oficio de Fortaleza'
    cartorio.tabeliao = '....'
    cartorio.save

    u_cartorio = cartorio.usuarios.new
    u_cartorio.login = u_cartorio.nome = 'usuario_cartorio'
    u_cartorio.password = u_cartorio.password_confirmation = '123456'
    u_cartorio.email = 'usuario_cartorio@uol.com.br'
    u_cartorio.save
    
    if u_cartorio.entidade and u_cartorio.entidade_id and u_cartorio.entidade_type
      puts "Cartorio atribuido"
      puts u_cartorio.entidade.oficio
    end

      
  end

  def self.down
    Cidade.destroy_all
    Cartorio.destroy_all
    Conveniado.destroy_all
    Tribunal.destroy_all
    Irtd.destroy_all
    Usuario.find(:all,:conditions => "login != 'admin'").each { |u| u.destroy }
  end
end

class CreateFncApagaFaturasPendentes < ActiveRecord::Migration
  def self.up
    execute "create or replace function fnc_apaga_faturas_pendentes(puf varchar) returns boolean as
$$
    begin
     -- inicia verificando inconsistencia entre o estado dos documentos e a fatura pendente
     perform * from documentos where fatura_id in (
                                                   select f.id from faturas f
                                                   join cartorios o on f.cartorio_id = o.id
                                                   join cidades c on c.id = o.cidade_id
                                                   where f.status = 0 and c.uf = puf)
                                                   and status_financeiro != 1;
     if FOUND then
       -- dados inconsistentes
       raise warning 'ATENCAO: RELACAO ENTRE FATURA E CONTRATOS ESTA INCONSISTENTE. STATUS INCONPATIVEIS';
       return false;
     else
       -- tenta apagar as faturas as fk vao garantir a integridade
       -- se nao for possivel vai ser retornado false para aplicacao
       delete from boletos where fatura_id in (select f.id from faturas f
                                               join cartorios o on f.cartorio_id = o.id
                                               join cidades c on c.id = o.cidade_id
                                               where f.status = 0 and c.uf = puf);
       delete from faturas where id in ( select f.id from faturas f
                                        join cartorios o on f.cartorio_id = o.id
                                        join cidades c on c.id = o.cidade_id
                                        where f.status = 0 and c.uf = puf);

       -- Não é necessário o update nos documentos, a exclusao da fatura ja atualiza o documento.                                         
       return true;   
     end if;
   exception
     when others then
        return false;       
  end;
$$
language plpgsql" 
  end

  def self.down
    execute "drop function fnc_apaga_faturas_pendentes(varchar);"
  end
end

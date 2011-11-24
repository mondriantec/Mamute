class CreateFncFaturas < ActiveRecord::Migration
  def self.up
    execute "
              create procedural language plpgsql;
              create type tp_conf_faturas_res as 
                (
                  id_fatura integer,
                  id_cartorio integer,
                  cidade varchar,
                  oficio varchar,
                  valor_nominal numeric(15,2),
                  valor_desconto numeric(15,2),
                  valor_final numeric(15,2)
                 );

              create or replace function fnc_gerar_faturas(pinicio date, pfim date, puf varchar, pvencimento date) returns setof tp_conf_faturas_res as
$$
  declare
     vcartorios record;
     vreg record;
     vqtd integer;
     vid_fatura integer;
     vcontratos record;   
     vsoma numeric(15,2) = 0;
  begin
     --inicia consultando os cartoiros por ordem de municipio
     for vcartorios in 
                      select o.id, c.nome, o.oficio from cartorios o
                      join cidades c on c.id = o.cidade_id
                      order by 2,3 loop
        -- agora verifica os documentos feitos pelo cartorio no período               
        select count(id) into vqtd from documentos where cartorio_id = vcartorios.id and fatura_id is null; 
          if vqtd > 0 then
            --existem documentos a serem faturados.
            --cria a fatura e depois marca os documentos
            insert into faturas (vencimento, status, valor, cartorio_id, created_at, updated_at) values
                                (pvencimento, 0, 0, vcartorios.id, now(), now()) returning id into vid_fatura;
            --agora fazer o update dos documentos e atualizar o valor da fatura
            for vcontratos in update documentos set fatura_id = vid_fatura, status_financeiro = 1
                             where cartorio_id = vcartorios.id and fatura_id is null and status_financeiro = 0
                             returning valor_cobrado loop
                vsoma := vsoma + vcontratos.valor_cobrado;
            end loop;                 
            -- atualizando o valor da fatura
            update faturas set valor = vsoma where id = vid_fatura;                    
          end if;
     end loop;                 
     --terminada a atualizacao, prepara agora a exibicao
     return query
               select f.id, o.id, c.nome, o.oficio, f.valor::numeric(15,2), 0.00::numeric(15,2)  as desconto, f.valor::numeric(15,2) from faturas f
               join cartorios o on o.id = f.cartorio_id
               join cidades c on c.id = o.cidade_id;
 end;
$$
language plpgsql volatile ;



             "
  end

  def self.down
    execute "DROP FUNCTION fnc_gerar_faturas(date, date, character varying, date);
             drop type tp_conf_faturas_res;
             DROP LANGUAGE plpgsql;"
  end
end

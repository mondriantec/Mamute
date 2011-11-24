class CorrigeIntegridade < ActiveRecord::Migration
  def self.up
    execute "CREATE OR REPLACE FUNCTION fnc_gerar_faturas(pinicio date, pfim date, puf character varying, pvencimento date)
  RETURNS SETOF tp_conf_faturas_res AS
$BODY$
  declare
     vcartorios record;
     vreg record;
     vqtd integer;
     vid_fatura integer;
     vcontratos record;   
     vsoma numeric(15,2) = 0;
  begin
     -- verifica se existem faturas pendentes se houver lista direto, se nao gera as faturas
     perform f.id from faturas f
     join cartorios o on f.cartorio_id = o.id
     join cidades c on o.cidade_id = c.id
     where c.uf = puf and f.status = 0;
    if not FOUND then          
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
              insert into boletos (fatura_id, vencimento, status, valor, created_at, updated_at) values
                                  (vid_fatura, pvencimento, 0, 0, now(), now());                    
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
     end if;  
       --terminada a atualizacao, prepara agora a exibicao
       return query
               select f.id, o.id, c.nome, o.oficio, f.valor::numeric(15,2), 0.00::numeric(15,2)  as desconto, f.valor::numeric(15,2) from faturas f
               join cartorios o on o.id = f.cartorio_id
               join cidades c on c.id = o.cidade_id
               where c.uf = puf and f.status = 0;

 end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;

DROP TRIGGER trg_fat_bol ON faturas;

CREATE TRIGGER trg_fat_bol
  BEFORE UPDATE OR DELETE
  ON faturas
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_fat_bol();

"
  end

  def self.down
  end
end

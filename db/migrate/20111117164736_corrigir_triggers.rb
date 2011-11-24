class CorrigirTriggers < ActiveRecord::Migration
  def self.up
     execute "CREATE OR REPLACE FUNCTION fnc_trg_pagamento_boleto()
  RETURNS trigger AS
$BODY$
  declare
    vboleto boletos;
    vstatus integer;
  begin
      if TG_OP = 'INSERT' or TG_OP = 'UPDATE' then
        select * into vboleto from boletos where id = NEW.boleto_id;
        if FOUND then
            if NEW.valor < vboleto.valor then
               vstatus := 1;
            else
               vstatus := 2;
            end if;
            -- atualiza a fatura, o boleto sera atualizado via trigger na fatura
            update faturas set status = vstatus where id = vboleto.fatura_id;          
            return NEW;
        end if;
      end if;  

      if TG_OP = 'DELETE' then
        select * into vboleto from boletos where id = OLD.boleto_id;
         -- atualiza a fatura, o boleto sera atualizado via trigger na fatura
            update faturas set status = 0 where id = vboleto.fatura_id;          
            return OLD;
      end if;
  end
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


CREATE OR REPLACE FUNCTION fnc_trg_fat_bol()
  RETURNS trigger AS
$BODY$
  begin
     if TG_OP = 'UPDATE' then
        update boletos set vencimento = NEW.vencimento, status = NEW.status, valor = NEW.valor, updated_at = now() where fatura_id = NEW.id;
        return NEW;
     end if;

     if TG_OP = 'DELETE' then
       -- desmarca os documentos
       update documentos set fatura_id = null, status_financeiro = 0 where fatura_id = OLD.id;
       return OLD;
     end if;
  end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
"
  end

  def self.down
  end
end

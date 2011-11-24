class AddTrgPagamentos < ActiveRecord::Migration
  def self.up
    execute "create or replace function fnc_trg_pagamento_boleto() returns trigger as
$$
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
            update faturas set status = vstatus where id = vboleto.id;          
            return NEW;
        end if;
      end if;  

      if TG_OP = 'DELETE' then
         -- atualiza a fatura, o boleto sera atualizado via trigger na fatura
            update faturas set status = 0 where id = vboleto.id;          
            return OLD;
      end if;
  end
$$
language plpgsql;

CREATE TRIGGER trg_pagmentos BEFORE INSERT OR UPDATE OR DELETE
   ON pagamentos FOR EACH ROW
   EXECUTE PROCEDURE public.fnc_trg_pagamento_boleto();
"
  end

  def self.down
    execute "DROP TRIGGER trg_pagmentos;
            drop function fnc_trg_pagamento_boleto(); "
  end
end

class TrgFatBol < ActiveRecord::Migration
  def self.up
    execute "create or replace function fnc_trg_fat_bol() returns trigger as
$$
  begin
     if TG_OP = 'INSERT' then
        insert into boletos (fatura_id, vencimento, valor, status, created_at, updated_at) values
                            (NEW.id, NEW.vencimento, NEW.valor, NEW.status, now(), now());
        return NEW;                    
     end if; 
     if TG_OP = 'UPDATE' then
        update boletos set vencimento = NEW.vencimento, valor = NEW.valor, updated_at = now() where fatura_id = NEW.id;
        return NEW;
     end if;
  end;
$$
language plpgsql ;

CREATE TRIGGER trg_fat_bol BEFORE INSERT OR UPDATE
   ON faturas FOR EACH ROW
   EXECUTE PROCEDURE public.fnc_trg_fat_bol();

"
  end

  def self.down
    execute "drop trigger trg_fat_bol;
             DROP FUNCTION fnc_trg_fat_bol();"
  end
end

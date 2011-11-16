class AtualizaTrgFatura < ActiveRecord::Migration
  def self.up
    execute "CREATE OR REPLACE FUNCTION fnc_trg_fat_bol()
  RETURNS trigger AS
$BODY$
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

     if TG_OP = 'DELETE' then
       -- desmarca os documentos
       update documentos set fatura_id = null, status_financeiro = 0 where fatura_id = OLD.id;
       return OLD;
     end if;
  end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER trg_fat_bol ON faturas;

CREATE TRIGGER trg_fat_bol
  BEFORE INSERT OR UPDATE OR DELETE
  ON faturas
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_fat_bol();


"
  end

  def self.down
    execute "CREATE OR REPLACE FUNCTION fnc_trg_fat_bol()
  RETURNS trigger AS
$BODY$
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
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER trg_fat_bol ON faturas;

CREATE TRIGGER trg_fat_bol
  BEFORE INSERT OR UPDATE 
  ON faturas
  FOR EACH ROW
  EXECUTE PROCEDURE fnc_trg_fat_bol();
"
  end
end

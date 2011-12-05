class CreateFncGeraValorCobrado < ActiveRecord::Migration
  def self.up
    execute "create or replace function fnc_gera_valor_cobrado(ptipo_documento integer, pqtd_paginas integer, pirtd_id integer, pservico_id integer) returns numeric(15,2) 
          as
          $$
            declare
               reg parametros_financeiros;
               valor_cobrado numeric(15,2) = 0;
               base_qtd float;
               base_valor numeric(15,2);
               resto integer;
            begin
              /***
                Função......: gera_valores
                parametros..: ptipo_documento, pqtd_paginas, pirtd_id, pservico_id
                retornos....: -1 -> Não encontrado o parametro financeiro para doc , uf e servico;

              ***/
               select * into reg from parametros_financeiros 
               where tipo_documento_id = ptipo_documento 
                 and entidade_id = pirtd_id
                 and servico_id = pservico_id;
               if not FOUND then
                 -- erro por nao encontrar o parametro para esse doc na uf
                    return -1;
               end if;

              -- verifica se a qtd de paginas esta ate o valor minimo
              if pqtd_paginas <= reg.qtd_paginas_inicial then
                 return reg.valor_qtd_inicial::numeric(15,2);
              else
                -- se maior entao faz o calculo
                base_valor := @(ceil(((pqtd_paginas - reg.qtd_paginas_inicial) * -1) / reg.qtd_pag_extra));
                resto := (pqtd_paginas - reg.qtd_paginas_inicial) % reg.qtd_pag_extra; 
                if resto > 0 then
                  base_valor := base_valor + 1;
                end if;
                  valor_cobrado := (reg.valor_qtd_inicial + (base_valor * reg.valor_qtd_extra))   ;
                  if valor_cobrado > reg.valor_limite then
                     valor_cobrado := reg.valor_limite;
                  end if;   
                
              end if;

              return valor_cobrado ;
                 
            end;
          $$
          language plpgsql volatile security definer "
 
  end

  def self.down
    execute "DROP FUNCTION fnc_gera_valor_cobrado(integer, integer, integer, integer);"
  end
end

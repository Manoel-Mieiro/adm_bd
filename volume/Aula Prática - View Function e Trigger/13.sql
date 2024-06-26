-- CRIE UMA TRIGGER CHAMADA 
-- CALCULAR_TOTAL_VENDAS_CLIENTE QUE, SEMPRE QUE 
-- UMA NOVA VENDA FOR INSERIDA OU UMA VENDA FOR 
-- EXCLUÍDA DA TABELA VENDAS, RECALCULE O TOTAL DE 
-- VENDAS REALIZADAS POR ESSE CLIENTE E ATUALIZE O 
-- CAMPO CORRESPONDENTE NA TABELA CLIENTES
CREATE
OR REPLACE FUNCTION UPTD_VENDAS() RETURNS TIRGGER AS $ $
BEGIN
    IF (TG_OP = 'INSERT') THEN 
    UPDATE clientes('total_vendas') 
    SET (total_vendas+1)
    WHERE cliente_id = new.cliente_id;
    ELSE IF (TG_OP = 'DELETE') THEN
    UPDATE clientes('total_vendas') 
    SET (total_vendas-1)
    WHERE cliente_id = old.cliente_id;
    END IF;
RETURN NEW;

END;

$ $ LANGUAGE PLPGSQL;

CREATE
OR REPLACE TRIGGER CALCULAR_TOTAL_VENDAS_CLIENTE
AFTER
INSERT
    OR DELETE ON VENDAS FOR EACH ROW EXECUTE FUNCTION UPDT_VENDAS();
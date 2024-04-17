-- Crie uma function que calcula o total de dias que um 
-- determinado carro ficou alugado

CREATE OR REPLACE FUNCTION days_rent(car INTEGER)returns INTEGER AS 
$$
DELCARE
dias INT := 0;
BEGIN
    SELECT 
        DATE_PART('day', COALESCE(dt_devolucao, now()) - dt_locacao) + 1
    INTO dias FROM aluguel_carro
WHERE id_carro = car;
    RETURN dias;
END;
$$LANGUAGE PLPGSQL;

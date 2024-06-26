-- CRIE UMA FUNÇÃO CHAMADA CALCULAR_IDADE QUE 
-- RECEBE A DATA DE NASCIMENTO DE UMA PESSOA E 
-- RETORNA A IDADE ATUAL
CREATE
OR REPLACE FUNCTION CALCULAR_IDADE(DATA_NASCIMENTO DATE) RETURNS NUMERIC AS $ $ DECLARE IDADE NUMERIC;

BEGIN
SELECT
    (
        CASE
            WHEN(
                DATE_PART('MONTH', NOW()) < DATE_PART('MONTH', DATA_NASCIMENTO) THEN IDADE := DATE_PART('YEAR', NOW()) - DATE_PART('YEAR', DATA_NASCIMENTO)
            ),
            WHEN (
                DATE_PART('MONTH', NOW()) > DATE_PART('MONTH', DATA_NASCIMENTO) THEN IDADE := DATE_PART('YEAR', NOW()) - DATE_PART('YEAR', DATA_NASCIMENTO) - 1
            )
        ) INTO IDADE
        FROM
            PESSOAS
    END;

$ $ LANGUAGE PLPGSQL;
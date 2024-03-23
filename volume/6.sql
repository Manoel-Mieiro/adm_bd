-- 6) Crie uma função chamada "contar_solicitacoes_por_ano" que recebe como entrada um ano e retorna o número total de solicitações criadas nesse ano.
-- CREATE LANGUAGE PLPGSQL;
CREATE
OR REPLACE FUNCTION CONTAR_SOLICITACOES_POR_ANO (ANO_SOLICITACAO VARCHAR, OUT QTD_SOLICITACOES INT) RETURNS INTEGER AS $$
BEGIN
    SELECT COUNT(*) INTO qtd_solicitacoes
    FROM solicitacao as s
    WHERE ano_solicitacao = s.ano;
END;
$$ LANGUAGE PLPGSQL;
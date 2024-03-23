-- 9) Crie uma trigger chamada "atualizar_situacao" que, ao ser acionada após a inserção de uma nova linha na tabela "historico_solicitacao", atualize automaticamente a situação da solicitação correspondente na tabela "solicitacao" para refletir a situação mais recente.
CREATE
OR REPLACE FUNCTION UPDT_SITUACAO () RETURNS TRIGGER AS $$ 

BEGIN
    UPDATE solicitacao
    SET situacao_tual = (
        SELECT nome
        FROM situacao_solicitacao
        WHERE id = NEW.situacao_solicitacao_id
    )
    WHERE id = NEW.solicitacao_id;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE
OR REPLACE TRIGGER ATUALIZAR_SITUACAO
AFTER INSERT ON HISTORICO_SOLICITACAO FOR EACH ROW
EXECUTE FUNCTION UPDT_SITUACAO ();
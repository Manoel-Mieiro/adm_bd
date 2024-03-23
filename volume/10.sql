-- 10) Crie uma trigger chamada "calcular_media_duracao" que, ao ser acionada após a conclusão de uma solicitação, calcule automaticamente a média de duração das solicitações do mesmo tipo de serviço e atualize um campo correspondente na tabela "subtipo_servico".
CREATE
OR REPLACE FUNCTION CALCULAR_MEDIA_DURACAO () RETURNS TRIGGER AS $$
DECLARE
    media_duracao NUMERIC;
BEGIN
    SELECT AVG(EXTRACT(EPOCH FROM (s.data_prazo - s.data_criacao)) / 86400)
    INTO media_duracao
    FROM solicitacao s
    JOIN subtipo_servico ss ON s.subtipo_service_id = ss.id
    WHERE ss.id = NEW.subtipo_service_id
    AND s.situacao_tual = 'Concluída';

    UPDATE subtipo_servico
    SET duracao_media = media_duracao
    WHERE id = NEW.subtipo_service_id;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER CALCULAR_MEDIA_DURACAO
AFTER
UPDATE OF SITUACAO_TUAL ON SOLICITACAO FOR EACH ROW WHEN (NEW.SITUACAO_TUAL = 'Concluída')
EXECUTE FUNCTION CALCULAR_MEDIA_DURACAO ();
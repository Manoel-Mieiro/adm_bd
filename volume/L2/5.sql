-- 5)Crie uma função chamada "calcular_duracao" que recebe como entrada a data de criação e a data de prazo de uma solicitação e retorna a duração em dias entre essas datas.
-- CREATE LANGUAGE PLPGSQL;
CREATE
OR REPLACE FUNCTION CALCULAR_DURACAO (
	DATA_CRIACAO TIMESTAMP,
	DATA_PRAZO TIMESTAMP,
	OUT QTD_DIAS INT
) AS $$BEGIN
	QTD_DIAS := extract(epoch from (coalesce(data_prazo, data_criacao) - data_criacao)/86400);
	END; $$ LANGUAGE PLPGSQL;
-- 7)Crie uma função chamada "calcular_tempo_medio_atraso" que calcula o tempo médio de atraso de todas as solicitações que estão atrasadas em relação ao prazo estabelecido.
CREATE
OR REPLACE FUNCTION CALCULAR_TEMPO_MEDIO_ATRASO () RETURNS NUMERIC AS $$
	DECLARE 
		qtd_solicitacoes numeric;
		total_dias numeric;
		atraso_medio numeric;
		
	BEGIN

	-- primeiramente seleciono a soma de cada intervalo de datas entre criação e prazo (sendo data_prazo = data_criacao caso o prazo seja null)
	SELECT SUM(EXTRACT(
        -- no trecho abaixo eu também divido o resultado interno de EPOCH por 86400 que é a quantidade de segundos em 1 dia para que o resultado seja em dias
		EPOCH
		FROM
			(COALESCE(DATA_PRAZO, DATA_CRIACAO) - DATA_CRIACAO) / 86400)), COUNT(*) INTO total_dias, qtd_solicitacoes  
	FROM solicitacao s
	WHERE
    EXTRACT(EPOCH FROM (COALESCE(S.DATA_PRAZO, S.DATA_CRIACAO) - S.DATA_CRIACAO) / 86400) > 0; -- aqui verifico se há algo em atraso

	atraso_medio:= total_dias/qtd_solicitacoes; 
-- o bloco abaixo padroniza o resultado como 0 para o caso de um resulado nulo (cenário no qual não temos atraso)
IF atraso_medio IS NULL THEN

	atraso_medio:= 0;
	END IF;
	
	return atraso_medio;
	
END; 
$$ LANGUAGE PLPGSQL;
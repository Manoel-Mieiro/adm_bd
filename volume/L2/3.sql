-- 3) Crie uma view chamada "solicitacoes_atrasadas" que lista todas as solicitações que estão atrasadas em relação ao prazo estabelecido, exibindo o protocolo, a data de criação e o tempo de atraso em dias.
CREATE OR REPLACE VIEW SOLICITACOES_ATRASADAS AS
SELECT
	S.PROTOCOLO AS PROTOCOLO,
	S.DATA_CRIACAO AS DATACRIACAO,
	(
		EXTRACT(
			EPOCH
			FROM
				COALESCE(S.DATA_PRAZO, S.DATA_CRIACAO)
				-- coalesce é para previnir resultados nulos para o prazo, atribuindo assim o mesmo valor da criação ao prazo quando não especificado
				- S.DATA_CRIACAO
		) / 86400
		-- 86400 é a quantidade de segundos em um dia, de forma a retornar o valor em extract no formato de dias e não segundos
	) AS DIAS_EM_ATRASO
FROM
	SOLICITACAO AS S
	JOIN HISTORICO_SOLICITACAO AS H ON (H.SOLICITACAO_ID = S.ID)
WHERE
-- aqui no where repeti o cálculo dos dias em atraso pra poder retornar só o que está com masi de 0 dias. Contudo, não ficou bem grande e me parece a abordagem errada, ainda que funcione
	EXTRACT(
			EPOCH
			FROM
				COALESCE(S.DATA_PRAZO, S.DATA_CRIACAO)
				-- coalesce é para previnir resultados nulos para o prazo, atribuindo assim o mesmo valor da criação ao prazo quando não especificado
				- S.DATA_CRIACAO
		) / 86400 > 0
	AND H.SITUACAO_SOLICITACAO_ID != 3 -- coloquei essa condição pra retornar apenas o que está em atraso no momento, previnindo atrasos de solicitações já concluídas
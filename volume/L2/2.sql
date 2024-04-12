-- 2) Crie uma view chamada "solicitacoes_concluidas_ano" que mostra o número total de solicitações concluídas em cada ano, juntamente com a média de duração das solicitações concluídas nesse ano.

CREATE OR REPLACE VIEW SOLICITACOES_CONCLUIDAS_ANO AS
SELECT
	COUNT(S.ID) AS TOTALSOLICITACOES,
	S.ANO AS ANO,
	AVG(
		(
			EXTRACT(
				EPOCH
				FROM
					COALESCE(S.DATA_PRAZO, S.DATA_CRIACAO)
					-- coalesce é para previnir resultados nulos para o prazo, atribuindo assim o mesmo valor da criação ao prazo quando não especificado
					- S.DATA_CRIACAO
			) / 86400
			-- 86400 é a quantidade de segundos em um dia, de forma a retornar o valor em extract no formato de dias e não segundos
		)
	) AS DURACAOMEDIA
FROM
	SOLICITACAO AS S
	JOIN HISTORICO_SOLICITACAO AS H ON (H.SOLICITACAO_ID = S.ID)
WHERE
	H.SITUACAO_SOLICITACAO_ID = 3
GROUP BY
	S.ANO;
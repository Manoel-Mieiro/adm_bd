-- 4) Crie uma view chamada "solicitacoes_por_status" que mostra o número total de solicitações agrupadas por status (pendente, em andamento, concluída), exibindo também a porcentagem de solicitações em relação ao total.
CREATE VIEW SOLICITACOES_POR_STATUS AS
SELECT
	COUNT(SS.NOME) AS QUANTIDADE,
	SS.NOME AS STATUS,
	(
		COUNT(SS.NOME) /
		-- como há join mais abaixo, tive que fazer uma subquery pra contar corretamente a quantidade de solicitacoes
		(
			SELECT
				COUNT(*)
			FROM
				SOLICITACAO
		)::FLOAT
	) * 100 AS PERCENTUAL_DE_SOLICITACOES
FROM
	SITUACAO_SOLICITACAO AS SS
	JOIN HISTORICO_SOLICITACAO AS H ON (H.SITUACAO_SOLICITACAO_ID = SS.ID)
	JOIN SOLICITACAO AS S ON (S.ID = H.SOLICITACAO_ID)
GROUP BY
	SS.NOME;
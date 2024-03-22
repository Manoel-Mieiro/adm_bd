-- 1) Crie uma view chamada "solicitacoes_em_andamento" que lista todas as solicitações que estão atualmente em andamento, exibindo o protocolo, a data de criação, o tipo de serviço e o subtipo de serviço associados.


CREATE OR REPLACE VIEW SOLICITACOES_EM_ANDAMENTO AS
SELECT
	S.PROTOCOLO AS PROTOCOLO,
	S.DATA_CRIACAO AS DATACRIACAO,
	T.NOME AS TIPOSERVICO,
	SS.NOME AS SUBTIPOSERVICO
FROM
	SOLICITACAO AS S
	JOIN HISTORICO_SOLICITACAO AS H ON (H.SOLICITACAO_ID = S.ID)
	JOIN SUBTIPO_SERVICO AS SS ON (SS.ID = S.SUBTIPO)
	JOIN TIPO_SERVICO AS T ON (T.ID = SS.TIPO_SERVICO_ID)
WHERE
	H.SITUACAO_SOLICITACAO_ID != 3;


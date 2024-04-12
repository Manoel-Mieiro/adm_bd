-- CRIE UMA VIEW QUE RETORNE O RESULTADO DO ALUNO EM CADA UMA DAS DISCIPLINAS
-- QUE ELE ESTÁ MATRICULADO. SE O CÁLCULO (P1 + P2)/2 > 7 OU PF > 7 A LINHA DEVE
-- RETORNAR ‘APROVADO’, CASO CONTRÁRIO DEVE RETORNAR ‘REPROVADO’. LEMBRANDO
-- QUE A VIEW DEVE LISTAR ISSO PARA TODOS OS ALUNOS.
CREATE VIEW RENDIMENTO AS
SELECT
    A.NOME AS ALUNO,
    C.NOME AS CURSO,
    CASE
        WHEN (
            CASE
                WHEN (
                    N.TIPO_PROVA = 'P1' THEN N.NOTA
                    ELSE 0
                END
            ) + (
                CASE
                    WHEN N.TIPO_PROVA = 'P2' THEN N.NOTA
                    ELSE 0
                END
            )
        ) / 2 > 7
        OR (
            CASE
                WHEN N.TIPO_PROVA = 'PF' THEN N.NOTA
                ELSE 0
            END
        ) > 7 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS STATUS
FROM
    MATRICULA AS M
    JOIN ALUNOS AS A ON M.ID_ALUNO = A.ID
    JOIN CURSOS AS C ON M.ID_CURSO = C.ID
    JOIN NOTA AS N ON N.ID_MATRICULA = M.ID
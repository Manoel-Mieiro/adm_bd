-- CRIE UMA VIEW QUE LISTE A QUANTIDADE DE ALUNOS APROVADOS E REPROVADOS EM
-- CADA DISCIPLINA. USE O CÁLCULO (P1 + P2)/2 > 7 OU PF > 7 PARA VERIFICAR SE ELE FOI
-- APROVADO
CREATE VIEW QUANTITATIVO_SITUACAO AS
SELECT
    SUM(
        CASE
            WHEN (
                CASE
                    WHEN N.TIPO_PROVA = 'P1' THEN N.NOTA
                    ELSE 0
                END + CASE
                    WHEN N.TIPO_PROVA = 'P2' THEN N.NOTA
                    ELSE 0
                END
            ) / 2 > 7
            OR CASE
                WHEN N.TIPO_PROVA = 'PF' THEN N.NOTA
                ELSE 0
            END > 7 THEN 1
            ELSE 0
        END
    ) AS APROVADOS,
    SUM(
        CASE
            WHEN (
                CASE
                    WHEN N.TIPO_PROVA = 'P1' THEN N.NOTA
                    ELSE 0
                END + CASE
                    WHEN N.TIPO_PROVA = 'P2' THEN N.NOTA
                    ELSE 0
                END
            ) / 2 < 7
            OR CASE
                WHEN N.TIPO_PROVA = 'PF' THEN N.NOTA
                ELSE 0
            END < 7 THEN 1
            ELSE 0
        END
    ) AS REPROVADOS
FROM
    MATRICULA AS M
    JOIN CURSO AS C ON C.ID = M.ID_CURSO
    JOIN NOTA AS N ON N.ID_MATRICULA = M.ID
GROUP BY
    C.ID